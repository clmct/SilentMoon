//
//  TabBarCoordinator.swift
//  SilentMoon
//

import UIKit

class TabBarCoordinator: CoordinatorProtocol {
  // MARK: - Properties
  
  var navigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  private var name = "Alex"
  
  // MARK: - Init
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  // MARK: - Public Methods
  
  func start() {
    UITabBar.appearance().barTintColor = UIColor.backgroundNight
    navigationController.setNavigationBarHidden(true, animated: false)
    let tabBarController = CustomTabBarController()
    var viewControllers: [UINavigationController] = []
    
    tabBarController.tabBar.frame.size.height = 200
    
    let homeViewController = UINavigationController(rootViewController: HomeViewController.fromSB)
    let sleepViewController = UINavigationController(rootViewController: SleepMusicViewController())
    let mediateViewController = UINavigationController(rootViewController: MediateViewController.fromSB)
    let musicViewController = UINavigationController(rootViewController: MusicViewController.musicV2)
    let profileViewController = UINavigationController(rootViewController: MusicViewController.musicV1)

    homeViewController.tabBarItem.image = R.image.tb1()
    sleepViewController.tabBarItem.image = R.image.tb2()
    mediateViewController.tabBarItem.image = R.image.tb3()
    musicViewController.tabBarItem.image = R.image.tb4()
    profileViewController.tabBarItem.image = R.image.tb5()
    
    viewControllers.append(contentsOf: [homeViewController,
                                        sleepViewController,
                                        mediateViewController,
                                        musicViewController,
                                        profileViewController])
    viewControllers.forEach { $0.setNavigationBarHidden(true, animated: true) }
    
    tabBarController.viewControllers = viewControllers
    navigationController.pushViewController(tabBarController, animated: false)
  }
  
}
