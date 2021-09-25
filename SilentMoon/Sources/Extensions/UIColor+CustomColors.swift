//
//  UIColor+CustomColors.swift
//  SilentMoon
//

import UIKit

extension UIColor {
  static let background = UIColor.white
  static let backgroundNight = UIColor.hexStringToUIColor(hex: "03174C")
  static let basic1 = UIColor(red: 161 / 255, green: 178 / 255, blue: 178 / 255, alpha: 1)
  static let basic2 = UIColor(red: 142 / 255, green: 151 / 255, blue: 253 / 255, alpha: 1)
  static let basic3 = UIColor(red: 242 / 255, green: 243 / 255, blue: 247 / 255, alpha: 1)
  static let basic4 = UIColor.hexStringToUIColor(hex: "#7583CA")
  static let basic5 = UIColor.hexStringToUIColor(hex: "#3F414E")
  static let basic6 = UIColor.hexStringToUIColor(hex: "#A0A3B1")
  static let basic7 = UIColor.hexStringToUIColor(hex: "#E6E7F2")
  static let basic8 = UIColor.hexStringToUIColor(hex: "#98A1BD")
  static let basic9 = UIColor.hexStringToUIColor(hex: "#A1A4B2")
  static let basic10 = UIColor.hexStringToUIColor(hex: "#BABCC6")
  static let basic11 = UIColor.hexStringToUIColor(hex: "#FBFBFB")
  
}

extension UIColor {
  static func hexStringToUIColor (hex: String) -> UIColor {
    var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") {
      cString.remove(at: cString.startIndex)
    }
    
    if cString.count != 6 {
      return UIColor.gray
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                   green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                   blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                   alpha: CGFloat(1.0))
  }
}
