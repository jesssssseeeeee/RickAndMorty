import UIKit

final class CharacterListController: UIViewController, ViewSpecificController {
    typealias RootView = ListView
    
    let characterService: CharacterService = CharacterServiceImp()
    
    var viewModels: [Character] = [] {
        didSet {
            self.tableViewDataSource = CharacterTableViewDataSource(viewModel: viewModels)
            self.tableViewDelegate?.count = viewModels.count
        }
    }
    
    var tableViewDataSource: CharacterTableViewDataSource? {
        didSet {
            view().tableView.dataSource = tableViewDataSource
            view().tableView.reloadData()
        }
    }
    
    var tableViewDelegate: CharacterTableViewDelegate? {
        didSet {
            view().tableView.delegate = tableViewDelegate
            tableViewDelegate?.delegate = self
        }
    }
    
    override func loadView() {
        view = ListView(cellTypes: [CharacterCell.self])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDelegate = CharacterTableViewDelegate()
        tableViewDelegate?.loadMore = fetch
        fetch()
    }
    
    func fetch() {
        print("asdsadasd")
        characterService.fetch { [weak self] (result) in
            switch result {
            case .success(let characters):
                DispatchQueue.main.async {
                    self?.viewModels.append(contentsOf: characters)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    // viewDidLoad(грузится) -> viewWillAppear - > viewDidAppear(был показан)
}

// MARK: SelectRowDelegate

extension CharacterListController: SelectRowDelegate {
    func didTapped(row: Int) {
        let desinationViewController =  CharacterDetailController()
        desinationViewController.character = viewModels[row]
        navigationController?.pushViewController(desinationViewController, animated: true)
    }
}
