//
//  WelcomeSleepViewController.swift
//  SilentMoon
//

import UIKit

class WelcomeSleepViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction private func actionButton(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
}

extension WelcomeSleepViewController {
  static var fromSB: UIViewController {
    let viewController = R.storyboard.welcomeSleepStoryboard().instantiateViewController(withIdentifier: "welcomeSleep")
      as? WelcomeSleepViewController ?? UIViewController()
    return viewController
  }
}
