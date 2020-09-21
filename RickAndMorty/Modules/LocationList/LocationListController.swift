import UIKit

final class LocationListController: UIViewController, ViewSpecificController {
    typealias RootView = ListView
    
    let rickApi = RickAPI ()
    var viewModels: [Location] = []
    var tableViewDelegate: LocationTableViewDelegate? {
        didSet {
            view().tableView.delegate = tableViewDelegate
            tableViewDelegate?.delegate = self
        }
    }
    
    override func loadView() {
        view = ListView(cellTypes: [UITableViewCell.self])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view().tableView.dataSource = self
        tableViewDelegate = LocationTableViewDelegate()
        rickApi.getLocations { (response) in
            DispatchQueue.main.async {
                self.viewModels = response.results
                self.view().tableView.reloadData()
            }
        }
    }
}

extension LocationListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseId, for: indexPath)
        cell.textLabel?.text = viewModels[indexPath.row].name
        return cell
    }
}

// MARK: - SelectRowDelegate

extension LocationListController: SelectRowDelegate {
    func didTapped(row: Int) {
        let destinationViewController = LocationDetailController()
        destinationViewController.location = viewModels[row]
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
