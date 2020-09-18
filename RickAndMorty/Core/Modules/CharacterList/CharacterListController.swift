import UIKit

final class CharacterListController: UIViewController, ViewSpecificController {
    typealias RootView = ListView

    let rickApi = RickAPI ()
    var viewModels: [Character] = []

    override func loadView() {
        view = ListView(cellTypes: [UITableViewCell.self])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view().tableView.dataSource = self
        view().tableView.delegate = self
        rickApi.getCharacters { (response) in
            DispatchQueue.main.async {
                self.viewModels = response.results
                self.view().tableView.reloadData()
            }
        }
    }
//viewDidLoad(грузится) -> viewWillAppear - > viewDidAppear(был показан)
}

extension CharacterListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destinationViewController = CharacterDetailController()
        destinationViewController.character = viewModels[indexPath.row]
        navigationController?.pushViewController(destinationViewController, animated: true)
//        present(destinationViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseId, for: indexPath)
        cell.textLabel?.text = viewModels[indexPath.row].name
        return cell
    }
}
