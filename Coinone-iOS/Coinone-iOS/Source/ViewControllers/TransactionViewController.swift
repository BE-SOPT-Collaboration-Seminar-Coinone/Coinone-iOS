//
//  TransactionViewController.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/17.
//
import SnapKit
import Then
import UIKit

// MARK: - TransactionViewController
class TransactionViewController: UIViewController {
  
  // MARK: - LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    register()
    layout()
    self.contentCollectionView.delegate = self
    self.contentCollectionView.dataSource = self
    self.hidesBottomBarWhenPushed = false
    self.navigationController?.navigationBar.isHidden = true
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.hidesBottomBarWhenPushed = false
    self.tabBarController?.tabBar.isHidden = false
  }
  
  // MARK: - Components
  lazy var contentCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.isScrollEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.allowsMultipleSelection = true
    return collectionView
  }()
  
  var menuTitles: [String] = ["마이", "거래소", "간편구매", "정보"]
  var filterTitles: [String] = ["코인명", "현재가", "등락률", "거래대금"]
  var sort: String = "total-price"
  var ascending: String = "-1"
}

// MARK: - Extensions
extension TransactionViewController {
  
  // MARK: - Helpers
  func register() {
    self.contentCollectionView.register(TopMenuCollectionViewCell.self, forCellWithReuseIdentifier: TopMenuCollectionViewCell.identifier)
    self.contentCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.identifier)
    self.contentCollectionView.register(TitleCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleCollectionReusableView.identifier)
    self.contentCollectionView.register(CoinListCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CoinListCollectionReusableView.identifier)
  }
  func layout() {
    layoutConentCollectionView()
  }
  func layoutConentCollectionView() {
    self.view.add(contentCollectionView) {
      $0.backgroundColor = .white
      $0.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }
  func setTabbar() {
    let tabController = TabbarViewContorller()
    tabController.addChild(self)
  }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension TransactionViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.section == 0 {
      let width: CGFloat
      switch indexPath.item {
      case 1:
        width = 45
      case 2:
        width = 60
      default:
        width = 30
      }
      return CGSize(width: width+self.view.frame.width*10/375, height: 30)
    }
    else {
      let width: CGFloat
      switch indexPath.item {
      case 0:
        width = 94
      case 1:
        width = 94
      case 2:
        width = 66
      default:
        width = 70
      }
      return CGSize(width: (self.view.frame.width-52)*width/323, height: 30)
    }
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    if section == 0 {
      return CGSize(width: self.view.frame.width, height: 40)
    }
    else {
      return CGSize()
    }
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    if section == 1 {
      return CGSize(width: self.view.frame.width, height: 1000)
    }
    return CGSize()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    if section == 1 {
      return 4
    }
    else {
      return 8
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 8
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 20, bottom: 16, right: 0)
  }
}

// MARK: - UICollectionViewDataSource
extension TransactionViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 {
      return self.menuTitles.count
    }
    else if section == 1 {
      return self.filterTitles.count
    }
    else {
      return 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.section == 0 {
      guard let topMenuCell = collectionView.dequeueReusableCell(withReuseIdentifier: TopMenuCollectionViewCell.identifier, for: indexPath) as? TopMenuCollectionViewCell else {
        return UICollectionViewCell()
      }
      topMenuCell.titleLabel.setLabel(text: self.menuTitles[indexPath.item], textColor: .textGray, font: .notoSansKRBoldFont(fontSize: 16))
      topMenuCell.awakeFromNib()
      if indexPath.item == HomeViewController.menuIndex {
        topMenuCell.underLineView.isHidden = false
        topMenuCell.underLineView.backgroundColor = .black
        topMenuCell.titleLabel.textColor = .black
      }
      else {
        topMenuCell.underLineView.isHidden = true
        topMenuCell.titleLabel.textColor = .textGray
      }
      return topMenuCell
    }
    else if indexPath.section == 1 {
      guard let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as? FilterCollectionViewCell else {
        return UICollectionViewCell()
      }
      filterCell.dataBind(title: self.filterTitles[indexPath.item])
      filterCell.awakeFromNib()
      return filterCell
    }
    else {
      return UICollectionViewCell()
    }
  }
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    var reusableView = UICollectionReusableView()
    if (kind == UICollectionView.elementKindSectionHeader) {
      if indexPath.section == 0 {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleCollectionReusableView.identifier, for: indexPath) as? TitleCollectionReusableView else {
          return UICollectionReusableView()
        }
        headerView.awakeFromNib()
        reusableView = headerView
      }
    }
    else if (kind == UICollectionView.elementKindSectionFooter) {
      if indexPath.section == 1 {
        guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CoinListCollectionReusableView.identifier, for: indexPath) as? CoinListCollectionReusableView else {
          return UICollectionReusableView()
        }
        footerView.awakeFromNib()
        footerView.setInitialList(sort: self.sort, ascending: self.ascending)
        reusableView = footerView
      }
    }
    return reusableView
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.section == 0 && indexPath.item == 0 && self.navigationController?.parent != nil {
      HomeViewController.menuIndex = 0
      let homeViewController = HomeViewController()
      self.navigationController?.pushViewController(homeViewController, animated: false)
    }
    if indexPath.section == 0 && indexPath.item == 0 && self.navigationController?.parent == nil {
      HomeViewController.menuIndex = 0
      self.navigationController?.popViewController(animated: false)
    }
    if indexPath.section == 1 {
      switch(indexPath.item) {
      case 0:
        if FilterCollectionViewCell.titleTag == true {
          ascending = "-1"
          FilterCollectionViewCell.titleTag = false
        }
        else {
          ascending = "1"
          FilterCollectionViewCell.titleTag = true
        }
        self.sort = "title"
        collectionView.reloadData()
      case 1:
        if FilterCollectionViewCell.currentPriceTag == true {
          ascending = "-1"
          FilterCollectionViewCell.currentPriceTag = false
        }
        else {
          ascending = "1"
          FilterCollectionViewCell.currentPriceTag = true
        }
        self.sort = "current-price"
        collectionView.reloadData()
      case 2:
        if FilterCollectionViewCell.fluctuationTag == true {
          ascending = "-1"
          FilterCollectionViewCell.fluctuationTag = false
        }
        else {
          ascending = "1"
          FilterCollectionViewCell.fluctuationTag = true
        }
        self.sort = "degree"
        collectionView.reloadData()
      case 3:
        if FilterCollectionViewCell.totalPriceTag == true {
          ascending = "-1"
          FilterCollectionViewCell.totalPriceTag = false
        }
        else {
          ascending = "1"
          FilterCollectionViewCell.totalPriceTag = true
        }
        self.sort = "total-price"
        collectionView.reloadData()
      default:
        if FilterCollectionViewCell.totalPriceTag == true {
          ascending = "-1"
          FilterCollectionViewCell.totalPriceTag = false
        }
        else {
          ascending = "1"
          FilterCollectionViewCell.totalPriceTag = true
        }
        self.sort = "total-price"
        collectionView.reloadData()
      }
    }
  }
}
