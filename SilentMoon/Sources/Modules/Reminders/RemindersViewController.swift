//
//  RemindersViewController.swift
//  SilentMoon
//

import UIKit
import RxSwift
import RxCocoa

class RemindersViewController: UIViewController {
  @IBOutlet private var dayButtonOutlets: [UIButton]!
  
  private var dictIsSelected: [Int: Bool] = [:]
  private let disposeBag = DisposeBag()
  private lazy var tabBarCoordinator = TabBarCoordinator(navigationController: navigationController ?? UINavigationController())
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    dayButtonOutlets.forEach { button in
      button.layer.cornerRadius = button.frame.height / 2
      button.layer.masksToBounds = false
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dictIsSelected[1] = true
    dictIsSelected[2] = true
    dictIsSelected[3] = true
    dictIsSelected[4] = true
    dictIsSelected[5] = false
    dictIsSelected[6] = false
    dictIsSelected[7] = true
    
    dayButtonOutlets.forEach { button in
      guard let dict = dictIsSelected[button.tag] else { return }
      if dict {
        selectedButton(button)
      } else {
        unselectedButton(button)
      }
    }
    
    setup()
  }
  
  @IBAction private func saveAction(_ sender: Any) {
    tabBarCoordinator.start()
  }
  
  @IBAction private func noThanksAction(_ sender: Any) {
    tabBarCoordinator.start()
  }
  
  private func setup() {
    dayButtonOutlets.forEach { button in
      button.rx
        .tap
        .subscribe { [unowned self] _ in
          switch dictIsSelected[button.tag] {
          case .none:
            selectedButton(button)
            dictIsSelected[button.tag] = true
          case .some(let value):
            switch value {
            case true:
              unselectedButton(button)
              dictIsSelected[button.tag] = false
            case false:
              selectedButton(button)
              dictIsSelected[button.tag] = true
            }
          }
        }.disposed(by: disposeBag)
    }
  }
  
  private func selectedButton(_ button: UIButton) {
    button.backgroundColor = .hexStringToUIColor(hex: "3F414E")
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 1
    button.setTitleColor(.white, for: .normal) 
  }
  
  private func unselectedButton(_ button: UIButton) {
    button.backgroundColor = .background
    button.layer.borderColor = UIColor.hexStringToUIColor(hex: "A1A4B2").cgColor
    button.layer.borderWidth = 1
    button.setTitleColor(.hexStringToUIColor(hex: "A1A4B2"), for: .normal)
  }

}

extension RemindersViewController {
  static var fromSB: UIViewController {
    let viewController = R.storyboard.remindersStoryboard().instantiateViewController(withIdentifier: "reminders")
      as? RemindersViewController ?? UIViewController()
    return viewController
  }
}
