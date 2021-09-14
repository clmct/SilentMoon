//
//  SignInViewController.swift
//  SilentMoon
//

import UIKit
import RxSwift

class SignInViewController: UIViewController {
  // MARK: - Properties
  
  private let backButton = UIButton()
  private let backgroundImageView = UIImageView()
  private let titleLabel = UILabel()
  private let facebookButton = UIButton()
  private let googleButton = UIButton()
  private let loginButton = UIButton()
  private let emailDescriptionLabel = UILabel()
  private let emailTextField = CustomTextFiled()
  private let passwordTextField = CustomTextFiled()
  private let forgotPasswordLabel = UILabel()
  
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
    view.addSubview(backButton)
    view.addSubview(titleLabel)
    view.addSubview(facebookButton)
    view.addSubview(googleButton)
    view.addSubview(emailDescriptionLabel)
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    view.addSubview(loginButton)
    view.addSubview(forgotPasswordLabel)
    
    setupBackgroundImageView()
    setupBackButton()
    setupTitleLabel()
    setupFacebookButton()
    setupGoogleButton()
    setupEmailDescriptionLabel()
    setupEmailTextField()
    setupPasswordTextField()
    setupLoginButton()
    setupForgotPasswordLabel()
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
    
    titleLabel.text = "Welcome Back!"
    titleLabel.font = .basic3
  }
  
  private func setupFacebookButton() {
    facebookButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.height.equalTo(63)
      make.top.equalTo(titleLabel.snp.bottom).offset(33)
    }
    
    facebookButton.setTitle("CONTINUE WITH FACEBOOK", for: .normal)
    facebookButton.backgroundColor = .basic2
    facebookButton.layer.cornerRadius = 30
    facebookButton.layer.masksToBounds = true
  }
  
  private func setupGoogleButton() {
    googleButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.height.equalTo(63)
      make.top.equalTo(facebookButton.snp.bottom).offset(33)
    }
    
    googleButton.setTitle("CONTINUE WITH GOOGLE", for: .normal)
    googleButton.setTitleColor(.black, for: .normal)
    googleButton.backgroundColor = .white
    googleButton.layer.cornerRadius = 30
    googleButton.layer.masksToBounds = true
    googleButton.layer.borderWidth = 1
  }
  
  private func setupEmailDescriptionLabel() {
  }
  
  private func setupEmailTextField() {
    emailTextField.snp.makeConstraints { make in
      make.width.equalTo(374)
      make.centerX.centerY.equalToSuperview()
    }
  }
  
  private func setupPasswordTextField() {
    passwordTextField.snp.makeConstraints { make in
      make.width.equalTo(374)
      make.top.equalTo(emailTextField.snp.bottom).offset(20)
      make.centerX.equalTo(emailTextField.snp.centerX)
    }
  }
  
  private func setupLoginButton() {
    loginButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.top.equalTo(passwordTextField.snp.bottom).inset(-20)
      make.height.equalTo(63)
    }
    
    loginButton.setTitle("LOG IN", for: .normal)
    loginButton.backgroundColor = .basic2
    loginButton.layer.cornerRadius = 30
    loginButton.layer.masksToBounds = true
  }
  
  private func setupForgotPasswordLabel() {
    forgotPasswordLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(loginButton.snp.bottom).offset(20)
    }
    
    forgotPasswordLabel.text = "Forgot Password?"
  }

}
