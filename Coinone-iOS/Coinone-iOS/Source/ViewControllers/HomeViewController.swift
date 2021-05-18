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
  let mainCoinTitleLogoView = UIImageView()
  let mainCoinEnglishTitleLabel = UILabel()
  let mainCoinKoreanTitleLabel = UILabel()
  let mainCoinPriceLabel = UILabel()
  let mainCointStateContainerView = UIView()
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
        $0.height.equalTo(18)
      }
    }
  }
  func layoutSearchButton() {
    self.topView.add(searchButton) {
      $0.setImage(UIImage(named:"searchIcon"), for: .normal)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.titleImageView.snp.top)
        $0.trailing.equalTo(self.topView.snp.trailing).offset(-20)
        $0.width.height.equalTo(self.titleImageView.snp.height)
      }
    }
  }
  func layoutMenuCollectionView() {
    self.topView.add(menuCollectionView) {
      $0.backgroundColor = .white
      $0.snp.makeConstraints {
        $0.top.equalTo(self.titleImageView.snp.bottom).offset(13.6)
        $0.leading.equalTo(self.titleImageView.snp.leading)
        $0.width.equalTo(self.view.frame.width*224/375)
        $0.height.equalTo(30)
      }
    }
  }
  func layoutMainCointContainerView() {
    self.topView.add(mainCoinContainerView) {
      $0.backgroundColor = .white
      $0.layer.applyShadow(color: .blue, alpha: 0.12, x: 0, y: 0, blur: 8)
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.view.snp.centerX)
        $0.leading.equalTo(self.topView.snp.leading).offset(31)
        $0.top.equalTo(self.menuCollectionView.snp.bottom).offset(24)
        $0.height.equalTo(169)
      }
    }
  }
  func layoutMainCoinKoreanTitleLabel() {
    self.mainCoinContainerView.add(mainCoinKoreanTitleLabel) {
      $0.setLabel(text: "클레이튼", textColor: .coinGray, font: .notoSansKRMediumFont(fontSize: 11))
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.mainCoinContainerView.snp.centerX).offset(2)
        $0.top.equalTo(self.mainCoinContainerView.snp.top).offset(11)
      }
    }
  }
  func layoutMainCoinEnglishTitleLabel() {
    self.mainCoinContainerView.add(mainCoinEnglishTitleLabel) {
      $0.setLabel(text: "KLAY", textColor: .black, font: .notoSansKRBoldFont(fontSize: 14))
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.mainCoinKoreanTitleLabel.snp.centerY)
        $0.trailing.equalTo(self.mainCoinKoreanTitleLabel.snp.leading).offset(-4)
      }
    }
  }
  func layoutMainCoinTitleLogoView() {
    self.mainCoinContainerView.add(mainCoinTitleLogoView) {
      $0.image = UIImage(named: "coinIcon")
      $0.snp.makeConstraints {
        $0.trailing.equalTo(self.mainCoinEnglishTitleLabel.snp.leading).offset(-4)
        $0.centerY.equalTo(self.mainCoinKoreanTitleLabel.snp.centerY)
        $0.width.height.equalTo(self.mainCoinEnglishTitleLabel.snp.height)
      }
    }
  }
  func layoutMainCoinPriceLabel() {
    self.mainCoinContainerView.add(mainCoinPriceLabel) {
      $0.setLabel(text: "1,900.0", textColor: .black, font: UIFont.systemFont(ofSize: 20, weight: .bold))
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.mainCoinContainerView.snp.centerX)
        $0.top.equalTo(self.mainCoinEnglishTitleLabel.snp.bottom).offset(6)
      }
    }
  }
  func layoutMainCoinStateContainerView() {
    self.mainCoinContainerView.add(mainCointStateContainerView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.mainCoinContainerView.snp.centerX)
        $0.top.equalTo(self.mainCoinPriceLabel.snp.bottom).offset(10)
        $0.leading.equalTo(self.mainCoinTitleLogoView.snp.leading)
        $0.trailing.equalTo(self.mainCoinKoreanTitleLabel.snp.trailing)
      }
    }
  }
  func layoutMainCoinStateIconView() {
    self.mainCointStateContainerView.add(mainCoinStateIconView) {
      $0.image = UIImage(named: "rise")
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.mainCointStateContainerView.snp.leading)
        $0.centerY.equalTo(self.mainCointStateContainerView.snp.centerY)
        $0.width.height.equalTo(6)
      }
    }
  }
  func layoutMainCoinStateDegreeLabel() {
    self.mainCointStateContainerView.add(mainCoinStateDegreeLabel) {
      $0.setLabel(text: "66.8", textColor: .textRed, font: UIFont.systemFont(ofSize: 14, weight: .bold))
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.mainCointStateContainerView.snp.centerY)
        $0.leading.equalTo(self.mainCoinStateIconView.snp.trailing).offset(5)
      }
    }
  }
  func layoutMainCoinStatePercentageLabel() {
    self.mainCointStateContainerView.add(mainCoinStatePercentageLabel) {
      $0.setLabel(text: "(+3.64%)", textColor: .textRed, font: UIFont.systemFont(ofSize: 14, weight: .medium))
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.mainCointStateContainerView.snp.centerY)
        $0.leading.equalTo(self.mainCoinStateDegreeLabel.snp.trailing).offset(5)
      }
    }
  }
  func layoutMainCoinGraphView() {
    self.mainCoinContainerView.add(mainCoinGraphView) {
      $0.image = UIImage(named: "graph")
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.mainCoinContainerView.snp.leading)
        $0.trailing.equalTo(self.mainCoinContainerView.snp.trailing)
        $0.top.equalTo(self.mainCointStateContainerView.snp.bottom).offset(10)
      }
    }
  }
  
  func layout() {
    layoutTopView()
    layoutTitleImageView()
    layoutSearchButton()
    layoutMenuCollectionView()
    layoutMainCointContainerView()
    layoutMainCoinKoreanTitleLabel()
    layoutMainCoinEnglishTitleLabel()
    layoutMainCoinTitleLogoView()
    layoutMainCoinPriceLabel()
    layoutMainCoinStateContainerView()
    layoutMainCoinStateIconView()
    layoutMainCoinStateDegreeLabel()
    layoutMainCoinStatePercentageLabel()
    layoutMainCoinGraphView()
  }
}
