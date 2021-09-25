//
//  SleepMusicViewController.swift
//  SilentMoon
//

import UIKit
import RxCocoa
import RxSwift

private extension Constants {
  static let cells = [CellData(image: R.image.s1() ?? UIImage(), title: "Night Island", description: "45 MIN • SLEEP MUSIC"),
                      CellData(image: R.image.s2() ?? UIImage(), title: "Sweet Sleep", description: "45 MIN • SLEEP MUSIC"),
                      CellData(image: R.image.s3() ?? UIImage(), title: "Good Night", description: "45 MIN • SLEEP MUSIC"),
                      CellData(image: R.image.s4() ?? UIImage(), title: "Moon Clouds", description: "45 MIN • SLEEP MUSIC"),
                      CellData(image: R.image.s1() ?? UIImage(), title: "Night Island", description: "45 MIN • SLEEP MUSIC"),
                      CellData(image: R.image.s2() ?? UIImage(), title: "Sweet Sleep", description: "45 MIN • SLEEP MUSIC"),
                      CellData(image: R.image.s3() ?? UIImage(), title: "Good Night", description: "45 MIN • SLEEP MUSIC"),
                      CellData(image: R.image.s4() ?? UIImage(), title: "Moon Clouds", description: "45 MIN • SLEEP MUSIC")]
}

class SleepMusicViewController: UIViewController {
  private let closeButton = UIButton()
  private let titleLabel = UILabel()
  private let collectionView = UICollectionView(frame: .zero,
                                                collectionViewLayout: UICollectionViewFlowLayout())
  
  private let spacing: CGFloat = 20
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.present(WelcomeSleepViewController.fromSB, animated: false, completion: nil)
    
    view.backgroundColor = .backgroundNight
    setupLayout()
    setupCollectionLayout()
    setupCollection()
  }
  
  private func setupCollection() {
    collectionView.delegate = self
    collectionView.dataSource = self
    
    collectionView.register(SleepMusicCollectionViewCell.self,
                            forCellWithReuseIdentifier: SleepMusicCollectionViewCell.identifier)
    collectionView.reloadData()
  }
  
  private func setupLayout() {
    view.addSubview(closeButton)
    closeButton.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.top.equalToSuperview().offset(50)
    }
    
    closeButton.setImage(R.image.backdarkbutton(), for: .normal)
    
    closeButton.rx.tap.subscribe { [weak self] _ in
      self?.navigationController?.popViewController(animated: true)
    }.disposed(by: disposeBag)
    
    view.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.centerY.equalTo(closeButton)
      make.centerX.equalToSuperview()
    }
    
    titleLabel.text = "Sleep Music"
    titleLabel.textColor = .basic7
    titleLabel.font = .basic11
    
    view.addSubview(collectionView)
    collectionView.backgroundColor = .clear
    collectionView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
      make.top.equalTo(titleLabel.snp.bottom).offset(50)
    }
  }
  
  private func setupCollectionLayout() {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    layout.minimumLineSpacing = spacing
    layout.minimumInteritemSpacing = spacing
    collectionView.collectionViewLayout = layout
  }
}

extension SleepMusicViewController: UICollectionViewDelegate {}

extension SleepMusicViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return Constants.cells.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SleepMusicCollectionViewCell.identifier,
                                                        for: indexPath) as? SleepMusicCollectionViewCell else {
      return UICollectionViewCell()
    }
    cell.configure(data: Constants.cells[indexPath.row], cellType: .music)
    return cell
  }
}

extension SleepMusicViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let numberOfItemsPerRow: CGFloat = 2
    let spacingBetweenCells: CGFloat = 20
    let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
    let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
    return CGSize(width: width, height: width)
  }
}
