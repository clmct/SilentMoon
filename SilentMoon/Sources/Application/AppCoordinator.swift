//
//  AppCoordinator.swift
//  SilentMoon
//

import UIKit

class AppCoordinator: CoordinatorProtocol {
  var navigationController: UINavigationController
  
  init() {
    navigationController = UINavigationController()
  }
  
  func start() {
    navigationController.setNavigationBarHidden(true, animated: false)
    navigationController.pushViewController(OnboardingViewController(), animated: true)
  }
}
