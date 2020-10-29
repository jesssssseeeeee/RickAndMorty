import UIKit

final class EpisodeDetailController: UIViewController, ViewSpecificController {
    typealias RootView = EpisodeDetailView
    
    var episode: Episode?
    
    override func loadView() {
        view = EpisodeDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view().viewModel = episode
    }
}
