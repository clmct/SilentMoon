//
//  SignUpViewController.swift
//  SilentMoon
//

import UIKit
import RxSwift

class SignUpViewController: UIViewController {
  // MARK: - Properties
  
  private let scrollView = UIScrollView()
  private let contentView = UIView()
  private let backButton = UIButton()
  private let backgroundImageView = UIImageView()
  private let titleLabel = UILabel()
  private let facebookButton = UIButton()
  private let googleButton = UIButton()
  private let loginButton = UIButton()
  private let emailDescriptionLabel = UILabel()
  private let emailTextField = CustomTextFiled(placeholder: "Email address")
  private let passwordTextField = CustomTextFiled(placeholder: "Password")
  private let repeatPasswordTextField = CustomTextFiled(placeholder: "Password")
  private let privacyLabel = UILabel()
  
  private let disposeBag = DisposeBag()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .background
    setupLayout()
  }
  
  // MARK: - Private Methods
  private func setupLayout() {
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubview(backgroundImageView)
    contentView.addSubview(backgroundImageView)
    contentView.addSubview(backButton)
    contentView.addSubview(titleLabel)
    contentView.addSubview(facebookButton)
    contentView.addSubview(googleButton)
    contentView.addSubview(emailDescriptionLabel)
    contentView.addSubview(emailTextField)
    contentView.addSubview(passwordTextField)
    contentView.addSubview(repeatPasswordTextField)
    contentView.addSubview(loginButton)
    contentView.addSubview(privacyLabel)
    
    setupContentView()
    setupBackgroundImageView()
    setupBackButton()
    setupTitleLabel()
    setupFacebookButton()
    setupGoogleButton()
    setupEmailDescriptionLabel()
    setupEmailTextField()
    setupPasswordTextField()
    setupRepeatPasswordTextField()
    setupLoginButton()
    setupPrivacyLabel()
  }
  
  private func setupContentView() {
    scrollView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    contentView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      make.leading.trailing.equalTo(view)
    }
  }
  
  private func setupBackgroundImageView() {
    backgroundImageView.snp.makeConstraints { make in
      make.leading.trailing.top.equalToSuperview()
    }
    
    backgroundImageView.image = R.image.back2()
  }
  
  private func setupBackButton() {
    backButton.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(50)
      make.leading.equalToSuperview().offset(20)
      make.height.width.equalTo(55)
    }
    
    backButton.setImage(R.image.button(), for: .normal)
    
    backButton.rx.tap.subscribe { [weak self] _ in
      self?.navigationController?.popViewController(animated: true)
    }.disposed(by: disposeBag)
  }
  
  private func setupTitleLabel() {
    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(130)
      make.centerX.equalToSuperview()
    }
    
    titleLabel.text = "Create your account"
    titleLabel.font = .basic3
  }
  
  private func setupFacebookButton() {
    facebookButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.height.equalTo(63)
      make.top.equalTo(titleLabel.snp.bottom).offset(33)
    }
    
    facebookButton.setTitle("CONTINUE WITH FACEBOOK", for: .normal)
    facebookButton.addLeftImage(image: R.image.f(), offset: 30)
    facebookButton.backgroundColor = .basic4
    facebookButton.layer.cornerRadius = 30
    facebookButton.layer.masksToBounds = true
    facebookButton.setTitleColor(.white, for: .normal)
  }
  
  private func setupGoogleButton() {
    googleButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.height.equalTo(63)
      make.top.equalTo(facebookButton.snp.bottom).offset(33)
    }
    
    googleButton.setTitle("CONTINUE WITH GOOGLE", for: .normal)
    googleButton.addLeftImage(image: R.image.g(), offset: 30)
    googleButton.setTitleColor(.black, for: .normal)
    googleButton.backgroundColor = .white
    googleButton.layer.cornerRadius = 30
    googleButton.layer.masksToBounds = true
    googleButton.layer.borderWidth = 1
    googleButton.layer.borderColor = UIColor(red: 0.922, green: 0.918, blue: 0.925, alpha: 1).cgColor
  }
  
  private func setupEmailDescriptionLabel() {
    emailDescriptionLabel.snp.makeConstraints { make in
      make.top.equalTo(googleButton.snp.bottom).offset(40)
      make.centerX.equalToSuperview()
    }
    
    emailDescriptionLabel.text = "OR LOG IN WITH EMAIL"
    emailDescriptionLabel.font = .basic6
    emailDescriptionLabel.textColor = UIColor.hexStringToUIColor(hex: "A1A4B2")
  }
  
  private func setupEmailTextField() {
    emailTextField.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.top.equalTo(emailDescriptionLabel.snp.bottom).offset(40)
    }
  }
  
  private func setupPasswordTextField() {
    passwordTextField.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.top.equalTo(emailTextField.snp.bottom).offset(20)
      make.centerX.equalTo(emailTextField.snp.centerX)
    }
  }
  
  private func setupRepeatPasswordTextField() {
    repeatPasswordTextField.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.top.equalTo(passwordTextField.snp.bottom).offset(20)
      make.centerX.equalTo(emailTextField.snp.centerX)
    }
  }
  
  private func setupPrivacyLabel() {
    privacyLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(15)
    }
    
    privacyLabel.text = "I have read the Privacy Policy"
    privacyLabel.font = .basic6
    privacyLabel.textColor = UIColor.hexStringToUIColor(hex: "A1A4B2")
  }
  
  private func setupLoginButton() {
    loginButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.top.equalTo(privacyLabel.snp.bottom).inset(-20)
      make.height.equalTo(63)
    }
    
    scrollView.snp.remakeConstraints { make in
      make.edges.equalToSuperview()
      make.leading.trailing.equalTo(view)
      make.bottom.equalTo(loginButton.snp.bottom).offset(40)
    }
    
    loginButton.setTitle("GET STARTED", for: .normal)
    loginButton.backgroundColor = .basic2
    loginButton.layer.cornerRadius = 30
    loginButton.layer.masksToBounds = true
  }
}
