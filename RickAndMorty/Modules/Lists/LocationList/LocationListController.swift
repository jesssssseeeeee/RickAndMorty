import UIKit

final class LocationListController: UIViewController, ViewSpecificController {
    typealias RootView = ListView
    
    let networkService: NetworkService = NetworkServiceImp()
    
    var viewModels: [Location] = [] {
        didSet {
            self.tableViewDataSource = LocationTableViewDataSource(viewModel: viewModels)
        }
    }
    
    var tableViewDataSource: LocationTableViewDataSource? {
        didSet {
            view().tableView.dataSource = tableViewDataSource
            view().tableView.reloadData()
        }
    }
    
    var tableViewDelegate: LocationTableViewDelegate? {
        didSet {
            view().tableView.delegate = tableViewDelegate
            tableViewDelegate?.delegate = self
        }
    }
    
    override func loadView() {
        view = ListView(cellTypes: [LocationCell.self])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDelegate = LocationTableViewDelegate()
        networkService.request(.locations) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    let locations = try JSONDecoder().decode(LocationResponse.self, from: data)
                    DispatchQueue.main.async {
                        self?.viewModels = locations.results
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

extension LocationListController: SelectRowDelegate {
    func didTapped(row: Int) {
        let destinationViewController = LocationDetailController()
        destinationViewController.location = viewModels[row]
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
