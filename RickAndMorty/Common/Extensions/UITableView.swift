import UIKit

typealias ReusableTableViewCell = Reusable & UITableViewCell

extension UITableView {
    func register(_ array: [ReusableTableViewCell.Type]) {
        array.forEach { cell in
            register(cell.self, forCellReuseIdentifier: cell.reuseId)
        }
    }
}
