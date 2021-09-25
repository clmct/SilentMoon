//
//  SleepMusicCollectionViewCell.swift
//  SilentMoon
//

import UIKit

enum CellType {
  case music
  case home
}

class SleepMusicCollectionViewCell: UICollectionViewCell {
  static let identifier = "SleepMusicCollectionViewCell"
  
  private let imageView = UIImageView()
  private let titleLabel = UILabel()
  private let descriptionLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayout() {
    contentView.addSubview(imageView)
    contentView.addSubview(titleLabel)
    contentView.addSubview(descriptionLabel)
    
    imageView.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview()
      make.bottom.equalTo(titleLabel.snp.top).offset(-10)
    }
    
    titleLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(descriptionLabel.snp.top)
      make.height.equalTo(20)
    }
    
    descriptionLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.bottom.equalToSuperview()
      make.height.equalTo(20)
    }
    setupImageView()
    setupTitleLabel()
    setupDescriptionLabel()
  }
  
  private func setupImageView() {
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = 10
    imageView.layer.masksToBounds = true
  }
  
  private func setupTitleLabel() {
    titleLabel.textColor = .basic7
    titleLabel.font = .basic9
  }
  
  private func setupDescriptionLabel() {
    descriptionLabel.textColor = .basic8
    descriptionLabel.font = .basic10
  }
  
  func configure(data: CellData,
                 cellType: CellType) {
    imageView.image = data.image
    titleLabel.text = data.title
    descriptionLabel.text = data.description
    
    switch cellType {
    case .home:
      titleLabel.textColor = .basic5
      descriptionLabel.textColor = .basic9
    case .music:
      break
    }
  }
}
