import UIKit

final class LocationTableViewDataSource: NSObject, UITableViewDataSource {
    var viewModels: [Location] = []
    
    init(viewModel: [Location] = []) {
        self.viewModels = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.reuseId, for: indexPath)
        cell.textLabel?.text = viewModels[indexPath.row].name
        return cell
    }
}
