import UIKit

final class CharacterCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    let cellId = "cellId"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellId, for: indexPath) as! CollectionCell // swiftlint:disable:this force_cast
        cell.backgroundColor = .black
        return cell
    }
}
