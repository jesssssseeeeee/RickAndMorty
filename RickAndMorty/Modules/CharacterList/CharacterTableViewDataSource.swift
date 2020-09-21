import UIKit

final class CharacterTableViewDataSource: NSObject, UITableViewDataSource {
    var viewModels: [Character] = []
    
    init(viewModel: [Character] = []) {
        self.viewModels = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseId, for: indexPath)
        cell.textLabel?.text = viewModels[indexPath.row].name
        return cell
    }
}
