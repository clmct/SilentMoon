//
//  ChooseTopicViewController.swift
//  SilentMoon
//

import UIKit

class ChooseTopicViewController: UIViewController {
  private let backgroundImageView = UIImageView()
  private let titleLabel = UILabel()
  private let collectionView = UICollectionView(frame: .zero,
                                                collectionViewLayout: UICollectionViewFlowLayout())
  private let images = [R.image.ct1(), R.image.ct2(), R.image.ct3(), R.image.ct4(),
                        R.image.ct5(), R.image.ct6(), R.image.ct3(), R.image.ct4(),
                        R.image.ct1(), R.image.ct2(), R.image.ct3(), R.image.ct4()]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .background
    setupLayout()
    setupCollectionLayout()
    setupCollection()
  }
  
  private func setupCollection() {
    collectionView.delegate = self
    collectionView.dataSource = self
    
    collectionView.register(ChooseTopicCollectionViewCell.self,
                            forCellWithReuseIdentifier: ChooseTopicCollectionViewCell.identifier)
    collectionView.reloadData()
  }
  
  private func setupLayout() {
    view.addSubview(backgroundImageView)
    backgroundImageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    backgroundImageView.image = R.image.chooseTopicBack()
    backgroundImageView.contentMode = .bottom
    
    view.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(60)
      make.leading.equalToSuperview().offset(20)
    }
    
    let firstString = NSMutableAttributedString(string: "What Brings you\n",
                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.basic5,
                                                             NSAttributedString.Key.font: UIFont.basic3])
    let secondString = NSAttributedString(string: "to Silent Moon?\n",
                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.basic5,
                                                       NSAttributedString.Key.font: UIFont.basic13])
    let thirdString = NSAttributedString(string: "choose a topic to focuse on:",
                                         attributes: [
                                          NSAttributedString.Key.foregroundColor: UIColor.basic9,
                                          NSAttributedString.Key.font: UIFont.basic13])
    
    firstString.append(secondString)
    firstString.append(thirdString)
    titleLabel.attributedText = firstString
    titleLabel.numberOfLines = 3
    
    view.addSubview(collectionView)
    collectionView.backgroundColor = .clear
    collectionView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
      make.top.equalTo(titleLabel.snp.bottom).offset(30)
    }
  }
  
  private func setupCollectionLayout() {
    let layout = CustomCollectionViewLayout()
    layout.delegate = self
    collectionView.setCollectionViewLayout(layout, animated: true)
  }
}

extension ChooseTopicViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    navigationController?.pushViewController(RemindersViewController.fromSB, animated: true)
  }
}

extension ChooseTopicViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    images.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseTopicCollectionViewCell.identifier,
                                                        for: indexPath) as? ChooseTopicCollectionViewCell else {
      return UICollectionViewCell()
    }
    
    cell.configure(image: images[indexPath.row] ?? UIImage())
    return cell
  }
}

extension ChooseTopicViewController: PinterestLayoutDelegate {
  func collectionView( _ collectionView: UICollectionView,
                       heightForCellAtIndexPath indexPath: IndexPath) -> CGFloat {
    let height: CGFloat
    switch indexPath.item {
    case 0, 4, 8:
      height = 210
    case 1, 5, 9:
      height = 170
    case 2, 6, 10:
      height = 170
    case 3, 7, 11:
      height = 210
    default:
      height = 170
    }
    return height
  }
}
