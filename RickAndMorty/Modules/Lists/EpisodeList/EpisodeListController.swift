import UIKit

final class EpisodeListController: UIViewController, ViewSpecificController {
    typealias RootView = ListView
    
    let networkService: NetworkService = NetworkServiceImp()
    
    var viewModels: [Episode] = [] {
        didSet {
            self.tableViewDataSource = EpisodeListDataSource(viewModel: viewModels)
        }
    }
    
    var tableViewDataSource: EpisodeListDataSource? {
        didSet {
            view().tableView.dataSource = tableViewDataSource
            view().tableView.reloadData()
        }
    }
    
    var tableViewDelegate: EpisodeListDelegate? {
        didSet {
            view().tableView.delegate = tableViewDelegate
            tableViewDelegate?.delegate = self
        }
    }
    
    override func loadView() {
        view = ListView(cellTypes: [EpisodeCell.self])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDelegate = EpisodeListDelegate()
        networkService.request(.episodes) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    let episodes = try JSONDecoder().decode(EpisodeResponse.self, from: data)
                    DispatchQueue.main.async {
                        self?.viewModels = episodes.results
                    }
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - SelectRowDelegate

extension EpisodeListController: SelectRowDelegate {
    func didTapped(row: Int) {
        let destinationViewController = EpisodeDetailController()
        destinationViewController.episode = viewModels[row]
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
