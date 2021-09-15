//
//  OnboardingViewController.swift
//  SilentMoon
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class OnboardingViewController: UIViewController {
  // MARK: - Properties
  
  private let backgroundImageView = UIImageView()
  private let foregroundImageView = UIImageView()
  private let logoImageView = UIImageView()
  private let titleLabel = UILabel()
  private let descriptionLabel = UILabel()
  private let descriptionLogInLabel = UILabel()
  private let signInButton = UIButton(type: .system)
  private let logInButton = UIButton(type: .system)
  
  private let disposeBag = DisposeBag()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .background
    setupLayout()
  }
  
  // MARK: - Private Methods
  
  private func setupLayout() {
    view.addSubview(backgroundImageView)
    backgroundImageView.addSubview(foregroundImageView)
    view.addSubview(logInButton)
    view.addSubview(logoImageView)
    view.addSubview(titleLabel)
    view.addSubview(descriptionLabel)
    view.addSubview(signInButton)
    view.addSubview(descriptionLogInLabel)
    setupBackgroundImageView()
    setupForegroundImageView()
    setupLogoImageView()
    setupTitleLabel()
    setupDescriptionLabel()
    setupSignInButton()
    setupLogInButton()
    setupDescriptionLogInView()
  }
  
  private func setupBackgroundImageView() {
    let height = view.frame.height / 2
    backgroundImageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      make.bottom.equalToSuperview().inset(height)
    }
    
    backgroundImageView.image = R.image.onboardingBackground()
  }
  
  private func setupForegroundImageView() {
    foregroundImageView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(50)
      make.bottom.equalToSuperview().inset(100)
    }
    
    foregroundImageView.image = R.image.onboardingPerson()
    foregroundImageView.contentMode = .scaleAspectFit
  }
  
  private func setupLogoImageView() {
    logoImageView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().inset(50)
    }
    
    logoImageView.image = R.image.logo()
    logoImageView.contentMode = .scaleAspectFit
  }
  
  private func setupTitleLabel() {
    titleLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(60)
      make.bottom.equalTo(descriptionLabel.snp.top).inset(-15)
    }
    
    titleLabel.text = "We are what we do"
    titleLabel.textAlignment = .center
    titleLabel.font = .basic1
  }
  
  private func setupDescriptionLabel() {
    descriptionLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(60)
      make.bottom.equalTo(signInButton.snp.top).inset(-60)
    }
    
    descriptionLabel.text = "Thousand of people are using silent moon for smalls meditation"
    descriptionLabel.numberOfLines = 2
    descriptionLabel.textAlignment = .center
    descriptionLabel.font = .basic2
    descriptionLabel.textColor = .basic1
  }
  
  private func setupSignInButton() {
    signInButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.bottom.equalTo(descriptionLogInLabel.snp.top).inset(-20)
      make.height.equalTo(63)
    }
    
    signInButton.setTitle("SIGN UP", for: .normal)
    signInButton.backgroundColor = .basic2
    signInButton.layer.cornerRadius = 30
    signInButton.layer.masksToBounds = true
    signInButton.setTitleColor(.white, for: .normal)
  }
  
  private func setupDescriptionLogInView() {
    descriptionLogInLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(60)
      make.bottom.equalToSuperview().inset(100)
    }
    
    descriptionLogInLabel.text = "ALREADY HAVE AN ACCOUNT?"
    descriptionLogInLabel.font = .basic6
    descriptionLogInLabel.textColor = .basic1
  }

  private func setupLogInButton() {
    logInButton.snp.makeConstraints { make in
      make.leading.equalTo(descriptionLogInLabel.snp.trailing)
      make.bottom.equalTo(descriptionLogInLabel.snp.bottom)
      make.top.equalTo(descriptionLogInLabel.snp.top)
      make.trailing.equalToSuperview().inset(60)
    }
    
    logInButton.setTitle("LOG IN", for: .normal)
    logInButton.setTitleColor(.basic2, for: .normal)
    logInButton.titleLabel?.font = .basic6
    
    logInButton.rx.tap.subscribe { [weak self] _ in
      self?.navigationController?.pushViewController(SignInViewController(), animated: true)
    }.disposed(by: disposeBag)
    }
  }
