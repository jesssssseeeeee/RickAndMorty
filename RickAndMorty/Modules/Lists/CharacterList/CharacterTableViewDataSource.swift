import UIKit
import Kingfisher

final class CharacterTableViewDataSource: NSObject, UITableViewDataSource {
    var viewModels: [Character] = []

    init(viewModel: [Character] = []) {
        self.viewModels = viewModel
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.reuseId, for: indexPath)
        let viewModel = viewModels[indexPath.row]
        let placeHolderImage = R.image.placeholder()
        cell.textLabel?.text = viewModel.name
        cell.imageView?.kf.setImage(
            with: URL(string: viewModel.image),
            placeholder: placeHolderImage,
            options: [.forceRefresh]
        )
        (cell as? CharacterCell)?.statusView.image = viewModel.status.image
        return cell
    }
}
