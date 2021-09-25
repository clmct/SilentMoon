//
//  WelcomeViewController.swift
//  SilentMoon
//

import UIKit

class WelcomeViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction private func startAction(_ sender: Any) {
    navigationController?.pushViewController(ChooseTopicViewController(), animated: true)
  }
}

extension WelcomeViewController {
  static var fromSB: UIViewController {
    let viewController = R.storyboard.welcomeStoryboard().instantiateViewController(withIdentifier: "welcome")
      as? WelcomeViewController ?? UIViewController()
    return viewController
  }
}
