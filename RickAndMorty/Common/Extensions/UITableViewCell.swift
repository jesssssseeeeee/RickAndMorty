import UIKit

extension UITableViewCell {
    static var reuseId: String {
        String(describing: self)
    }
}
