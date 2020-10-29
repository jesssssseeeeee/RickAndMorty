import UIKit

final class CharacterTableViewDelegate: NSObject, UITableViewDelegate {
    
    weak var delegate: SelectRowDelegate?
    var count: Int = 0
    var loadMore: (() -> Void)?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didTapped(row: indexPath.row)
    }
    
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat { 100 }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row == (count - 2) else { return }
        loadMore?()
    }
}
