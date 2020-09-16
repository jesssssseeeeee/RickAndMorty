import UIKit

extension UITableView {
    func register(_ array: [UITableViewCell.Type]) {
        array.forEach { cell in
            register(cell.self, forCellReuseIdentifier: cell.reuseId)
        }
    }
}
