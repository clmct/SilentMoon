//
//  CustomTabBarController.swift
//  SilentMoon
//

import UIKit

class CustomTabBarController: UITabBarController {
  private lazy var defaultTabBarHeight = { tabBar.frame.size.height }()

  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    let newTabBarHeight = defaultTabBarHeight + 30.0
    var newFrame = tabBar.frame
    newFrame.size.height = newTabBarHeight
    newFrame.origin.y = view.frame.size.height - newTabBarHeight
    tabBar.frame = newFrame
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
