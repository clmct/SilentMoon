//
//  ListDataSource.swift
//  SilentMoon
//

import UIKit

struct CellModel {
  var title: String
  var image: UIImage?
}

private extension Constants {
  static let data: [CellModel] = [CellModel(title: "All", image: R.image.mAll()),
                             CellModel(title: "My", image: R.image.mMy()),
                             CellModel(title: "Anxious", image: R.image.mAnxious()),
                             CellModel(title: "Sleep", image: R.image.mSleep()),
                             CellModel(title: "Kids", image: R.image.mKids())]
}

class ListDataSource: NSObject, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    Constants.data.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionCell.identifier,
                                                        for: indexPath) as? ListCollectionCell else {
      return UICollectionViewCell()
    }
    
    cell.configure(image: Constants.data[indexPath.row].image ?? UIImage(),
                   title: Constants.data[indexPath.row].title)
    return cell
  }
}

extension ListDataSource: UICollectionViewDelegate {}
