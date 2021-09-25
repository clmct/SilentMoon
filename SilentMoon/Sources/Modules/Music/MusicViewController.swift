//
//  MusicViewController.swift
//  SilentMoon
//

import UIKit

private protocol MusicConstantsProtocol {
  var title: String { get }
  var titleColor: UIColor { get }
  var description: String { get }
  var backgroundImage: UIImage { get }
  var descriptionColor: UIColor { get }
  var sliderMinimumTrackTintColor: UIColor { get }
  var sliderThumbImage: UIImage { get }
  var backgroundButtonColor: UIColor { get }
  var foregroundButtonColor: UIColor { get }
  var backButtonImage: UIImage { get }
  var forwardButtonImage: UIImage { get }
  var pauseImage: UIImage { get }
}

private struct MusicConstants: MusicConstantsProtocol {
  var title: String
  var titleColor: UIColor
  var description: String
  var descriptionColor: UIColor
  var backgroundImage: UIImage
  var sliderMinimumTrackTintColor: UIColor
  var sliderThumbImage: UIImage
  var backgroundButtonColor: UIColor
  var foregroundButtonColor: UIColor
  var backButtonImage: UIImage
  var forwardButtonImage: UIImage
  var pauseImage: UIImage
}

extension MusicViewController {
  static let musicV1: MusicViewController = {
    let viewController = MusicViewController()
    viewController.constants = MusicConstants(title: "Night Island",
                                              titleColor: .basic7,
                                              description: "SLEEP MUSIC",
                                              descriptionColor: .basic5,
                                              backgroundImage: R.image.musicBackground() ?? UIImage(),
                                              sliderMinimumTrackTintColor: .basic7,
                                              sliderThumbImage: R.image.sliderThumpV1() ?? UIImage(),
                                              backgroundButtonColor: .basic5,
                                              foregroundButtonColor: .basic7,
                                              backButtonImage: R.image.musicBackButtonV1() ?? UIImage(),
                                              forwardButtonImage: R.image.musicForwardButtonV1() ?? UIImage(),
                                              pauseImage: R.image.pausev1() ?? UIImage())
    return viewController
  }()
  
  static let musicV2: MusicViewController = {
    let viewController = MusicViewController()
    viewController.constants = MusicConstants(title: "Focus Attention",
                                              titleColor: .basic5,
                                              description: "7 DAYS OF CALM",
                                              descriptionColor: .basic8,
                                              backgroundImage: R.image.musicBackgroundV2() ?? UIImage(),
                                              sliderMinimumTrackTintColor: .basic5,
                                              sliderThumbImage: R.image.sliderThump() ?? UIImage(),
                                              backgroundButtonColor: .basic10,
                                              foregroundButtonColor: .basic5,
                                              backButtonImage: R.image.backButton() ?? UIImage(),
                                              forwardButtonImage: R.image.forwardButton() ?? UIImage(),
                                              pauseImage: R.image.pausev2() ?? UIImage())
    return viewController
  }()
}

class MusicViewController: UIViewController {
  // MARK: - Properties
  
  private let closeButton = UIButton()
  private let likeButton = UIButton()
  private let downloadButton = UIButton()
  private let backgroundImageView = UIImageView()
  private let backgroundContentView = UIView()
  private let titleLabel = UILabel()
  private let descriptionLabel = UILabel()
  private let actionButton = UIButton()
  private let forwardButton = UIButton()
  private let backButton = UIButton()
  private let playerSlider = UISlider()
  private let minimumValueLabel = UILabel()
  private let maximumValueLabel = UILabel()
  
  private var constants: MusicConstantsProtocol?
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
  }
  
  // MARK: - Private Methods
  private func setupLayout() {
    view.addSubview(backgroundImageView)
    view.addSubview(closeButton)
    view.addSubview(likeButton)
    view.addSubview(downloadButton)
    view.addSubview(titleLabel)
    view.addSubview(descriptionLabel)
    view.addSubview(forwardButton)
    view.addSubview(backButton)
    view.addSubview(playerSlider)
    view.addSubview(minimumValueLabel)
    view.addSubview(maximumValueLabel)
    
    setupBackgroundImageView()
    setupNavigationBar()
    setupTitleLabel()
    setupDescriptionLabel()
    setupActionButton()
    setupForwardButton()
    setupBackButton()
    setupPlayerSlider()
    setupMinimumValueLabel()
    setupMaximumValueLabel()
  }
  
  private func setupNavigationBar() {
    closeButton.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.top.equalToSuperview().offset(50)
    }
    
    closeButton.setImage(R.image.closeButtonV2(), for: .normal)
    
    likeButton.snp.makeConstraints { make in
      make.trailing.equalTo(downloadButton.snp.leading).offset(-15)
      make.top.equalToSuperview().offset(50)
    }
    
    likeButton.setImage(R.image.likeButtonV2(), for: .normal)
    
    downloadButton.snp.makeConstraints { make in
      make.trailing.equalToSuperview().offset(-20)
      make.top.equalToSuperview().offset(50)
    }
    
    downloadButton.setImage(R.image.downloadButtonV2(), for: .normal)
  }
  
  private func setupBackgroundImageView() {
    backgroundImageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    backgroundImageView.image = constants?.backgroundImage
  }
  
  private func setupTitleLabel() {
    titleLabel.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
    
    titleLabel.text = constants?.title
    titleLabel.font = .basic7
    titleLabel.textColor = constants?.titleColor
  }
  
  private func setupDescriptionLabel() {
    descriptionLabel.snp.makeConstraints { make in
      make.centerX.equalTo(titleLabel)
      make.top.equalTo(titleLabel.snp.bottom).offset(15)
    }
    
    descriptionLabel.text = constants?.description
    descriptionLabel.font = .basic6
    descriptionLabel.textColor = constants?.descriptionColor
  }
  
  private func setupActionButton() {
    view.addSubview(backgroundContentView)
    backgroundContentView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.lessThanOrEqualTo(descriptionLabel.snp.bottom).offset(45)
      make.height.width.equalTo(110)
    }
    
    let foregroundContentView = UIView()
    backgroundContentView.addSubview(foregroundContentView)
    foregroundContentView.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
      make.height.width.equalTo(90)
    }
    
    foregroundContentView.addSubview(actionButton)
    actionButton.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
    
    backgroundContentView.layer.cornerRadius = 55
    foregroundContentView.layer.cornerRadius = 45

    actionButton.setImage(constants?.pauseImage ?? UIImage(), for: .normal)
    backgroundContentView.backgroundColor = constants?.backgroundButtonColor
    foregroundContentView.backgroundColor = constants?.foregroundButtonColor
  }
  
  private func setupForwardButton() {
    forwardButton.snp.makeConstraints { make in
      make.leading.equalTo(backgroundContentView.snp.trailing)
      make.trailing.equalToSuperview()
      make.centerY.equalTo(actionButton)
    }
    
    forwardButton.setImage(constants?.forwardButtonImage, for: .normal)
    
  }
  private func setupBackButton() {
    backButton.snp.makeConstraints { make in
      make.trailing.equalTo(backgroundContentView.snp.leading)
      make.leading.equalToSuperview()
      make.centerY.equalTo(actionButton)
    }
    
    backButton.setImage(constants?.backButtonImage, for: .normal)
    backButton.tintColor = .red
    
  }
  
  private func setupPlayerSlider() {
    playerSlider.snp.makeConstraints { make in
      make.top.lessThanOrEqualTo(backgroundContentView.snp.bottom).offset(45)
      make.leading.equalToSuperview().offset(40)
      make.trailing.equalToSuperview().offset(-40)
    }

    playerSlider.minimumTrackTintColor = constants?.sliderMinimumTrackTintColor
    playerSlider.maximumTrackTintColor = .basic6
    playerSlider.setThumbImage(constants?.sliderThumbImage, for: .normal)
  }
  
  private func setupMinimumValueLabel() {
    minimumValueLabel.snp.makeConstraints { make in
      make.top.equalTo(playerSlider.snp.bottom).offset(10)
      make.centerX.equalTo(playerSlider.snp.leading)
    }
    
    minimumValueLabel.text = "01:30"
    minimumValueLabel.textColor = constants?.titleColor
    minimumValueLabel.font = .basic8
  }
  
  private func setupMaximumValueLabel() {
    maximumValueLabel.snp.makeConstraints { make in
      make.top.equalTo(playerSlider.snp.bottom).offset(10)
      make.centerX.equalTo(playerSlider.snp.trailing)
    }
    
    maximumValueLabel.text = "45:00"
    maximumValueLabel.textColor = constants?.titleColor
    maximumValueLabel.font = .basic8
    
  }
}
