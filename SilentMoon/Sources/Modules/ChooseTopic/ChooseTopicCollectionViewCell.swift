//
//  ChooseTopicCollectionViewCell.swift
//  SilentMoon
//

import UIKit

class ChooseTopicCollectionViewCell: UICollectionViewCell {
  static let identifier = "ChooseTopicCollectionViewCell"
  
  private let imageView = UIImageView()
  
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
      make.edges.equalToSuperview()
    }
    
    setupImageView()
  }
  
  private func setupImageView() {
    imageView.contentMode = .center
    imageView.layer.cornerRadius = 10
    imageView.layer.masksToBounds = true
    imageView.contentMode = .scaleAspectFill
  }
  
  public func configure(image: UIImage) {
    imageView.image = image
  }
}
