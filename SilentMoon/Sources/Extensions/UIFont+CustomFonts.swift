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
  static let basic7 = UIFont.boldAppFont(ofSize: 34)
  static let basic8 = UIFont.mediumAppFont(ofSize: 16)
  static let basic9 = UIFont.boldAppFont(ofSize: 18)
  static let basic10 = UIFont.mediumAppFont(ofSize: 11)
  static let basic11 = UIFont.boldAppFont(ofSize: 24)
  static let basic12 = UIFont.regularAppFont(ofSize: 20)
  static let basic13 = UIFont.mediumAppFont(ofSize: 28)
}
