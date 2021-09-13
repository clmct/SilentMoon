//
//  AppCoordinator.swift
//  SilentMoon
//

import UIKit

class AppCoordinator {
  var navigationController: UINavigationController?
  
  init() {
    navigationController = UINavigationController()
  }
  
  func start() {
    let viewController = OnboardingViewController()
    navigationController?.setNavigationBarHidden(true, animated: false)
    navigationController?.pushViewController(viewController, animated: true)
  }
  
}
