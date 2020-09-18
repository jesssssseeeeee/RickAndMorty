import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let characterListViewController = UINavigationController(rootViewController: CharacterListController())
        characterListViewController.tabBarItem = UITabBarItem(title: "Character", image: nil, tag: 0)
        let locationListViewController = UINavigationController(rootViewController: LocationListController())
        locationListViewController.tabBarItem = UITabBarItem(title: "Location", image: nil, tag: 0)
        viewControllers = [characterListViewController , locationListViewController]
        
    }
}

