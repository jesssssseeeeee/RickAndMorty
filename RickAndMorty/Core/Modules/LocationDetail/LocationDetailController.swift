import UIKit

final class LocationDetailController: UIViewController, ViewSpecificController {
    
    typealias RootView = LocationDetailView
    
    var location: Location?
    
    override func loadView() {
        view = LocationDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view().viewModel = location
    }
    
}
