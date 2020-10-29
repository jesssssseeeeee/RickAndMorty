import  UIKit

typealias ReusableCollectionViewCell = Reusable & UICollectionViewCell

extension UICollectionView {
    func register(_ array: [ReusableCollectionViewCell.Type]) {
        array.forEach { cell in
            register(cell.self, forCellWithReuseIdentifier: cell.reuseId)
        }
    }
}
