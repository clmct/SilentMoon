//
//  UIFont+CustomFonts.swift
//  SilentMoon
//

import UIKit

extension UIFont {
  static func regularAppFont(ofSize size: CGFloat) -> UIFont {
    return .systemFont(ofSize: size, weight: .regular)
  }
  
  static func boldAppFont(ofSize size: CGFloat) -> UIFont {
    return .systemFont(ofSize: size, weight: .bold)
  }
  
  static func mediumAppFont(ofSize size: CGFloat) -> UIFont {
    return .systemFont(ofSize: size, weight: .medium)
  }
  
  static func semiboldAppFont(ofSize size: CGFloat) -> UIFont {
    return .systemFont(ofSize: size, weight: .semibold)
  }
  
  static let basic1 = UIFont.boldAppFont(ofSize: 30)
  static let basic2 = UIFont.boldAppFont(ofSize: 16)
  static let basic3 = UIFont.boldAppFont(ofSize: 28)
  static let basic4 = UIFont.regularAppFont(ofSize: 15)
  static let basic5 = UIFont.regularAppFont(ofSize: 240)
  static let basic6 = UIFont.regularAppFont(ofSize: 14)
}
