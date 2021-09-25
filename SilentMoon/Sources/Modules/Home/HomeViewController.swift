//
//  HomeViewController.swift
//  SilentMoon
//

import UIKit

struct CellData {
  var image: UIImage
  var title: String
  var description: String
}

private extension Constants {
  static let cells = [CellData(image: R.image.m1() ?? UIImage(), title: "Focus", description: "MEDITATION • 3-10 MIN"),
                      CellData(image: R.image.m2() ?? UIImage(), title: "Happiness", description: "MEDITATION • 3-10 MIN"),
                      CellData(image: R.image.m1() ?? UIImage(), title: "Focus", description: "MEDITATION • 3-10 MIN")]
}

class HomeViewController: UIViewController {
  @IBOutlet private weak var courseButtonOutlet: UIButton!
  @IBOutlet private weak var musicButtonOutlet: UIButton!
  @IBOutlet private weak var contentView: UIView!
  
  private let collectionView = UICollectionView(frame: .zero,
                                                collectionViewLayout: UICollectionViewFlowLayout())
  private let spacing: CGFloat = 20
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .background
    setup()
    setupLayout()
    setupCollectionLayout()
    setupCollection()
  }
  
  private func setup() {
    courseButtonOutlet.layer.cornerRadius = courseButtonOutlet.frame.size.height / 2
    courseButtonOutlet.layer.masksToBounds = true
    
    musicButtonOutlet.layer.cornerRadius = courseButtonOutlet.frame.size.height / 2
    musicButtonOutlet.layer.masksToBounds = true
  }
  
  private func setupCollection() {
    collectionView.delegate = self
    collectionView.dataSource = self
    
    collectionView.register(SleepMusicCollectionViewCell.self,
                            forCellWithReuseIdentifier: SleepMusicCollectionViewCell.identifier)
    collectionView.reloadData()
    collectionView.showsHorizontalScrollIndicator = false
  }
  
  private func setupLayout() {
    contentView.addSubview(collectionView)
    collectionView.backgroundColor = .clear
    collectionView.snp.makeConstraints { make in
      make.leading.trailing.top.bottom.equalToSuperview()
      make.height.equalTo(160)
    }
  }
  
  private func setupCollectionLayout() {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = spacing
    layout.minimumInteritemSpacing = spacing
    collectionView.collectionViewLayout = layout
  }
}

extension HomeViewController: UICollectionViewDelegate {
}

extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    Constants.cells.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SleepMusicCollectionViewCell.identifier,
                                                        for: indexPath) as? SleepMusicCollectionViewCell else {
      return UICollectionViewCell()
    }
    cell.configure(data: Constants.cells[indexPath.row], cellType: .home)
    return cell
  }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 160, height: 160)
  }
}

extension HomeViewController {
  static var fromSB: UIViewController {
    let viewController = R.storyboard.homeStoryboard().instantiateViewController(withIdentifier: "home")
      as? HomeViewController ?? UIViewController()
    return viewController
  }
}
