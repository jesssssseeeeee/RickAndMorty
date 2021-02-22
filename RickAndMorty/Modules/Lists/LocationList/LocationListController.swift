import UIKit

final class LocationListController: UIViewController, ViewSpecificController {
    typealias RootView = ListView
    
    let locationService: LocationService = LocationServiceImp()
    
    var viewModels: [Location] = [] {
        didSet {
            self.tableViewDataSource = LocationTableViewDataSource(viewModel: viewModels)
            self.tableViewDelegate?.count = viewModels.count
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
        tableViewDelegate?.loadMore = fetch
        fetch()
    }
    
    func fetch() {
        locationService.fetch { [weak self] (result) in
            switch result {
            case .success(let locations):
                DispatchQueue.main.async {
                    self?.viewModels.append(contentsOf: locations)
                }
            case .failure(let error):
                print(error.localizedDescription)
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
