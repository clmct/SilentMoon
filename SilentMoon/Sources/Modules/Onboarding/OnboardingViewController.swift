//
//  OnboardingViewController.swift
//  SilentMoon
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
  // MARK: - Properties
  
  private let backgroundImageView = UIImageView()
  private let foregroundImageView = UIImageView()
  private let titleView = UIView()
  private let descriptionView = UIView()
  private let signInButton = UIButton()
  private let logInButton = UIButton()
  private let descriptionLogInView = UIView()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .background
    setupLayout()
  }
  
  // MARK: - Private Methods
  
  private func setupLayout() {
    setupBackgroundImageView()
    setupForegroundImageView()
    setupTitleView()
    setupDescriptionView()
    setupSignInButton()
    setupLogInButton()
    setupDescriptionLogInView()
  }
  
  private func setupBackgroundImageView() {
    view.addSubview(backgroundImageView)
    
    let height = view.frame.height / 2
    backgroundImageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      make.bottom.equalToSuperview().inset(height)
    }
    
    backgroundImageView.image = R.image.onboardingBackground()
  }
  
  private func setupForegroundImageView() {
    backgroundImageView.addSubview(foregroundImageView)
    
    foregroundImageView.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(50)
      make.trailing.equalToSuperview().inset(50)
    }
    
    backgroundImageView.image = R.image.onboardingPerson()
  }
  
  private func setupTitleView() {
    
    
    
    
    
    
  }
  
  private func setupDescriptionView() {
    
    
    
    
    
    
  }
  
  private func setupSignInButton() {
    
    
    
    
    
    
  }

  
  private func setupLogInButton() {
    
    
    
    
    
    
    
    
    
  }
  
  private func setupDescriptionLogInView() {
    
    
    
    
    
    
    
    
    
    
    
  }
}
