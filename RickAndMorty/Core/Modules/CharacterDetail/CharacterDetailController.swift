import UIKit
import Kingfisher

final class CharacterDetailController: UIViewController, ViewSpecificController {
    typealias RootView = CharacterDetailView

    var character: Character?

    override func loadView() {
        view = CharacterDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view().viewModel = character
    }
}

