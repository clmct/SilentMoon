//
//  SignInViewController.swift
//  SilentMoon
//

import UIKit
import RxSwift

class SignInViewController: UIViewController {
  // MARK: - Properties
  
  private let scrollView = UIScrollView()
  private let contentView = UIView()
  private let backButton = UIButton()
  private let backgroundImageView = UIImageView()
  private let titleLabel = UILabel()
  private let facebookButton = UIButton()
  private let googleButton = UIButton()
  private let loginButton = UIButton()
  private let signupButton = UIButton()
  private let emailDescriptionLabel = UILabel()
  private let descriptionSignUpLabel = UILabel()
  private let emailTextField = CustomTextFiled(placeholder: "Email address")
  private let passwordTextField = CustomTextFiled(placeholder: "Password")
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
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubview(backgroundImageView)
    contentView.addSubview(backButton)
    contentView.addSubview(titleLabel)
    contentView.addSubview(facebookButton)
    contentView.addSubview(googleButton)
    contentView.addSubview(emailDescriptionLabel)
    contentView.addSubview(emailTextField)
    contentView.addSubview(passwordTextField)
    contentView.addSubview(loginButton)
    contentView.addSubview(forgotPasswordLabel)
    contentView.addSubview(descriptionSignUpLabel)
    contentView.addSubview(signupButton)
    
    setupContentView()
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
    setupDescriptionSignUpView()
    setupSignUpButton()
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
      make.leading.trailing.top.equalTo(view)
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
    
    loginButton.rx.tap.subscribe { [unowned self] _ in
      self.navigationController?.pushViewController(WelcomeViewController.fromSB, animated: true)
    }.disposed(by: disposeBag)
  }
  
  private func setupForgotPasswordLabel() {
    forgotPasswordLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(loginButton.snp.bottom).offset(20)
    }
    
    forgotPasswordLabel.text = "Forgot Password?"
  }
  
  private func setupDescriptionSignUpView() {
    descriptionSignUpLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(60)
      make.top.equalTo(forgotPasswordLabel.snp.bottom).offset(20)
    }
    
    scrollView.snp.remakeConstraints { make in
      make.edges.equalToSuperview()
      make.leading.trailing.equalTo(view)
      make.bottom.equalTo(descriptionSignUpLabel.snp.bottom).offset(20)
    }
    
    descriptionSignUpLabel.text = "ALREADY HAVE AN ACCOUNT? "
    descriptionSignUpLabel.font = .basic6
    descriptionSignUpLabel.textColor = .basic1
    descriptionSignUpLabel.minimumScaleFactor = 0.5
    descriptionSignUpLabel.adjustsFontSizeToFitWidth = true
  }
  
  private func setupSignUpButton() {
    signupButton.snp.makeConstraints { make in
      make.leading.equalTo(descriptionSignUpLabel.snp.trailing)
      make.bottom.equalTo(descriptionSignUpLabel.snp.bottom)
      make.top.equalTo(descriptionSignUpLabel.snp.top)
      make.trailing.equalToSuperview().inset(60)
    }
    
    signupButton.setTitle("SIGN UP", for: .normal)
    signupButton.setTitleColor(.basic2, for: .normal)
    signupButton.titleLabel?.font = .basic6
    
    signupButton.rx.tap.subscribe { [unowned self] _ in
      self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }.disposed(by: disposeBag)
    }
}
