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
    navigationController?.pushViewController(viewController, animated: true)
  }
  
}
