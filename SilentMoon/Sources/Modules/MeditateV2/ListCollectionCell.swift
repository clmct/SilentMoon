//
//  ListCollectionCell.swift
//  SilentMoon
//

import UIKit

class ListCollectionCell: UICollectionViewCell {
  static let identifier = "ListCollectionCell"
  
  private let imageView = UIImageView()
  private let titleLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayout() {
    contentView.addSubview(imageView)
    
    imageView.snp.makeConstraints { make in
      make.leading.trailing.top.equalToSuperview()
      make.height.equalTo(65)
    }
    
    setupImageView()
    
    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.top.equalTo(imageView.snp.bottom)
    }
  }
  
  private func setupImageView() {
    imageView.contentMode = .center
    imageView.layer.cornerRadius = 10
    imageView.layer.masksToBounds = true
    imageView.contentMode = .scaleAspectFill
  }
  
  public func configure(image: UIImage, title: String) {
    imageView.image = image
    titleLabel.text = title
  }
}
