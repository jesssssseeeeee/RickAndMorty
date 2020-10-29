import UIKit

protocol Reusable: AnyObject {
    static var reuseId: String { get }
}

extension Reusable where Self: UITableViewCell {
    static var reuseId: String {
        String(describing: self)
    }
}

extension Reusable where Self: UICollectionViewCell {
    static var reuseId: String {
        String(describing: self)
    }
}
