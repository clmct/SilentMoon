//
//  CustomTextField.swift
//  SilentMoon
//

import UIKit

class CustomTextFiled: UIView {
  // MARK: - Properties
  
  private let backgroundView = UIView()
  private let textField = UITextField()
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Private Methods
  
  private func setupLayout() {
    addSubview(backgroundView)
    backgroundView.addSubview(textField)
    backgroundView.backgroundColor = .basic3
    backgroundView.layer.cornerRadius = 15
    backgroundView.layer.masksToBounds = true
    
    backgroundView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      make.height.equalTo(63)
    }
    
    textField.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.bottom.equalToSuperview().inset(20)
    }
    
    textField.placeholder = "email"
  }
}
