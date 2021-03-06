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
  private let signUpButton = UIButton(type: .system)
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
    view.addSubview(signUpButton)
    view.addSubview(descriptionLogInLabel)
    setupBackgroundImageView()
    setupForegroundImageView()
    setupLogoImageView()
    setupTitleLabel()
    setupDescriptionLabel()
    setupSignUpButton()
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
      make.bottom.equalToSuperview().inset(60)
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
    titleLabel.minimumScaleFactor = 0.5
    titleLabel.adjustsFontSizeToFitWidth = true
  }
  
  private func setupDescriptionLabel() {
    descriptionLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(60)
      make.bottom.equalTo(signUpButton.snp.top).inset(-60)
    }
    
    descriptionLabel.text = "Thousand of people are using silent moon for smalls meditation"
    descriptionLabel.numberOfLines = 2
    descriptionLabel.textAlignment = .center
    descriptionLabel.font = .basic2
    descriptionLabel.textColor = .basic1
    descriptionLabel.minimumScaleFactor = 0.5
    descriptionLabel.adjustsFontSizeToFitWidth = true
  }
  
  private func setupSignUpButton() {
    signUpButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.bottom.equalTo(descriptionLogInLabel.snp.top).inset(-20)
      make.height.equalTo(63)
    }
    
    signUpButton.setTitle("SIGN UP", for: .normal)
    signUpButton.backgroundColor = .basic2
    signUpButton.layer.cornerRadius = 30
    signUpButton.layer.masksToBounds = true
    signUpButton.setTitleColor(.white, for: .normal)
    
    signUpButton.rx.tap.subscribe { [weak self] _ in
      self?.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }.disposed(by: disposeBag)
  }
  
  private func setupDescriptionLogInView() {
    descriptionLogInLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(60)
      make.bottom.equalToSuperview().offset(-40)
    }
    
    descriptionLogInLabel.text = "ALREADY HAVE AN ACCOUNT? "
    descriptionLogInLabel.font = .basic6
    descriptionLogInLabel.textColor = .basic1
    descriptionLogInLabel.minimumScaleFactor = 0.5
    descriptionLogInLabel.adjustsFontSizeToFitWidth = true
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
    
    logInButton.rx.tap.subscribe { [unowned self] _ in
      self.navigationController?.pushViewController(SignInViewController(), animated: true)
    }.disposed(by: disposeBag)
    }
  }
