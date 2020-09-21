import UIKit

final class LocationTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didTapped(row: indexPath.row)    }
    
    weak var delegate: SelectRowDelegate?
}


