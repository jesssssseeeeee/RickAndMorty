import UIKit

final class EpisodeListDataSource: NSObject, UITableViewDataSource {
    var viewModels: [Episode] = []

    init(viewModel: [Episode] = []) {
        self.viewModels = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.reuseId, for: indexPath)
        let viewModel = viewModels[indexPath.row]
        cell.textLabel?.text = viewModel.name
        return cell
    }
}
