//
//  MediateViewController.swift
//  SilentMoon
//

import UIKit
private extension Constants {
  static let images = [R.image.mm1(), R.image.mm2(), R.image.mm3(), R.image.mm4()]
}

class MediateViewController: UIViewController {
  @IBOutlet private weak var firstContentView: UIView!
  @IBOutlet private weak var contentView: UIView!
  
  private let dataSource = ListDataSource()
  private let firstCollectionView = UICollectionView(frame: .zero,
                                                     collectionViewLayout: UICollectionViewFlowLayout())
  private let collectionView = UICollectionView(frame: .zero,
                                                collectionViewLayout: UICollectionViewFlowLayout())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
    setupCollectionLayout()
    setupCollection()
  }
  
  private func setupCollection() {
    firstCollectionView.dataSource = dataSource
    firstCollectionView.delegate = dataSource

    firstCollectionView.register(ListCollectionCell.self,
                                 forCellWithReuseIdentifier: ListCollectionCell.identifier)
    firstCollectionView.reloadData()
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
    collectionView.register(ChooseTopicCollectionViewCell.self,
                            forCellWithReuseIdentifier: ChooseTopicCollectionViewCell.identifier)
    collectionView.reloadData()
  }
  
  private func setupLayout() {
    firstContentView.addSubview(firstCollectionView)
    firstCollectionView.backgroundColor = .clear
    firstCollectionView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    contentView.addSubview(collectionView)
    collectionView.backgroundColor = .clear
    collectionView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  private func setupCollectionLayout() {
    let firstLayout = UICollectionViewFlowLayout()
    let spacing: CGFloat = 10
    firstLayout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    firstLayout.minimumLineSpacing = spacing
    firstLayout.minimumInteritemSpacing = spacing
    firstLayout.scrollDirection = .horizontal
    firstCollectionView.setCollectionViewLayout(firstLayout, animated: true)
    
    let layout = CustomCollectionViewLayout()
    layout.delegate = self
    collectionView.setCollectionViewLayout(layout, animated: true)
  }
}

extension MediateViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  }
}

extension MediateViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    Constants.images.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChooseTopicCollectionViewCell.identifier,
                                                        for: indexPath) as? ChooseTopicCollectionViewCell else {
      return UICollectionViewCell()
    }
    
    cell.configure(image: Constants.images[indexPath.row] ?? UIImage())
    return cell
  }
}

extension MediateViewController: PinterestLayoutDelegate {
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

extension MediateViewController {
  static var fromSB: UIViewController {
    let viewController = R.storyboard.mediateStoryboard().instantiateViewController(withIdentifier: "meditate")
      as? MediateViewController ?? UIViewController()
    return viewController
  }
}
