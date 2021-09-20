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
    
    let storyboardWelcomeSleep = R.storyboard.welcomeSleepStoryboard()
    let initialWelcomeSleep = storyboardWelcomeSleep.instantiateViewController(withIdentifier: "welcomeSleep")
      as? WelcomeSleepViewController ?? viewController
    
    let storyboardWelcome = R.storyboard.welcomeStoryboard()
    let initialWelcome = storyboardWelcome.instantiateViewController(withIdentifier: "welcome")
      as? WelcomeViewController ?? viewController
    
    let storyboardReminders = R.storyboard.remindersStoryboard()
    let initialReminders = storyboardReminders.instantiateViewController(withIdentifier: "reminders")
      as? RemindersViewController ?? viewController
    
    navigationController?.setNavigationBarHidden(true, animated: false)
    navigationController?.pushViewController(viewController, animated: true)
  }
  
}
