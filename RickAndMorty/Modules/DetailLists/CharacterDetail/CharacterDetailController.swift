import UIKit
import Kingfisher

final class CharacterDetailController: UIViewController,
                                       ViewSpecificController {
    typealias RootView = CharacterDetailView
    
    let cellId = "cellId"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var character: Character?
    
    var collectionViewDataSource: CharacterCollectionViewDataSource? {
        didSet {
        }
    }
    var collectionViewDelegate: CharacterCollectionViewDelegate? {
        didSet {
        }
    }
    
    override func loadView() {
        view = CharacterDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view().viewModel = character
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: cellId)
    }
}
