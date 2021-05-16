//
//  HomeViewController.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/17.
//
import SnapKit
import Then
import UIKit

class HomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
  }
  
  // MARK: - Components
  let topView = UIView()
  let titleImageView = UIImageView()
  let searchButton = UIButton()
  let menuCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    
    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
    collectionView.isScrollEnabled = false
    return collectionView
  }()
  let mainCoinContainerView = UIView()
  let mainCoinContainerImageView = UIImageView()
  let mainCoinTitleLogoView = UIImageView()
  let mainCoinEnglishTitleLabel = UILabel()
  let mainCoinKoreanTitleLabel = UILabel()
  let mainCoinPriceLabel = UILabel()
  let mainCoinStateIconView = UIImageView()
  let mainCoinStateDegreeLabel = UILabel()
  let mainCoinStatePercentageLabel = UILabel()
  let mainCoinGraphView = UIImageView()
  
  let favoriteTableHeaderView = UIView()
  let favoriteTitleLabel = UILabel()
  let favoriteAddButton = UIButton()
  
  let favoriteTableView = UITableView()
}

extension HomeViewController {
  func layoutTopView() {
    self.view.add(topView) {
      $0.backgroundColor = .mainBlue
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.snp.top)
        $0.leading.equalTo(self.view.snp.leading)
        $0.width.equalTo(self.view.frame.width)
        $0.height.equalTo(self.view.frame.width*274/375)
      }
    }
  }
  func layoutTitleImageView() {
    self.topView.add(titleImageView) {
      $0.image = UIImage(named: "titleImage")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(9)
        $0.leading.equalTo(self.topView.snp.leading).offset(20)
        $0.width.equalTo(self.view.frame.width*98/375)
        $0.height.equalTo(17.4)
        
      }
    }
  }
  func layout() {
    layoutTopView()
    layoutTitleImageView()
  }
}
