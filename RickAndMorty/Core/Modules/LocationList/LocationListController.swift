import UIKit

class LocationListController: UIViewController, ViewSpecificController {
    typealias RootView = ListView
    
    let rickApi = RickAPI ()
    var viewModels: [Location] = []
    
    override func loadView() {
        view = ListView(cellTypes: [UITableViewCell.self])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view().tableView.dataSource = self
        view().tableView.delegate = self
        rickApi.getLocations { (response) in
            DispatchQueue.main.async {
                self.viewModels = response.results
                self.view().tableView.reloadData()
            }
        }
    }
}

extension LocationListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destinationViewController = LocationDetailViewController()
        destinationViewController.locationViewModel = viewModels[indexPath.row]
        navigationController?.pushViewController(destinationViewController, animated: true)
        //        present(destinationViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseId, for: indexPath)
        cell.textLabel?.text = viewModels[indexPath.row].name
        return cell
    }
}
