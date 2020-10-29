import UIKit

final class CollectionView: UIView {
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    init(cellTypes: [ReusableCollectionViewCell.Type]) {
        super.init(frame: .zero)
        collectionView.register(cellTypes)
        backgroundColor = .white
        addSubview(collectionView)
    }
    
    override func layoutSubviews() {
        collectionView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
