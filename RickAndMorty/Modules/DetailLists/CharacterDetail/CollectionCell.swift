import UIKit

final class CollectionCell: UICollectionViewCell {
    var imageView: UIImageView = {
        let imageView = UIImageView(image: R.image.alive())
           imageView.contentMode = .scaleAspectFill
           imageView.isUserInteractionEnabled = true
           return imageView
       }()
}
