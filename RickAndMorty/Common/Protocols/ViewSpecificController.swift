import UIKit

protocol ViewSpecificController: AnyObject {
    associatedtype RootView: UIView
}

extension ViewSpecificController where Self: UIViewController {
    func view() -> RootView {
        
        view as! RootView
    }
}
