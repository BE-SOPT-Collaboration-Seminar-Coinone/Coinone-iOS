//
//  HomeViewController.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/17.
//
import SnapKit
import Then
import UIKit

// MARK: - HomeViewController
class HomeViewController: UIViewController {
  
  // MARK: - LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
    register()
    self.menuCollectionView.delegate = self
    self.menuCollectionView.dataSource = self
    self.favoriteTableView.delegate = self
    self.favoriteTableView.dataSource = self
    self.navigationController?.navigationBar.isHidden = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.hidesBottomBarWhenPushed = false
    self.tabBarController?.tabBar.isHidden = false
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let popupViewController = PopupHsViewController()
    popupViewController.modalPresentationStyle = .overFullScreen
    self.present(popupViewController, animated: false, completion: nil)
  }

  
  // MARK: - Components
  static var menuIndex = 0
  
  let topView = UIView()
  let titleImageView = UIImageView()
  let searchButton = UIButton()
  let menuCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
    collectionView.isScrollEnabled = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
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
  
  private lazy var favoriteTableView = UITableView()
  
  var menuTitles: [String] = ["마이", "거래소", "간편구매", "정보"]
  var coinModel: [CoinModel] = [CoinModel(coinLogoImageName: "coinIcon",
                                          coinEnglishTitle: "KLAY",
                                          coinKoreanTitle: "클레이튼",
                                          coinPrice: "1,900.0",
                                          riseOrDescent: "rise",
                                          degree: "66.8",
                                          percentage: "(+3.64%)",
                                          graphImageName: "graph"),
                                CoinModel(coinLogoImageName: "coinIcon",
                                          coinEnglishTitle: "KLAY",
                                          coinKoreanTitle: "클레이튼",
                                          coinPrice: "1,900.0",
                                          riseOrDescent: "rise",
                                          degree: "66.8",
                                          percentage: "(+3.64%)",
                                          graphImageName: "graph")]
}


// MARK: - Extensions
extension HomeViewController {
  // MARK: - Helpers
  func register() {
    self.menuCollectionView.register(TopMenuCollectionViewCell.self, forCellWithReuseIdentifier: TopMenuCollectionViewCell.identifier)
    self.favoriteTableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.identifier)
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
    layoutFavoriteTableView()
  }
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
      $0.image = UIImage(named: "logoOncolor")
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
      $0.setImage(UIImage(named:"searchOnwhite"), for: .normal)
      $0.snp.makeConstraints {
        $0.top.equalTo(self.titleImageView.snp.top)
        $0.trailing.equalTo(self.topView.snp.trailing).offset(-20)
        $0.width.height.equalTo(self.titleImageView.snp.height)
      }
    }
  }
  func layoutMenuCollectionView() {
    self.topView.add(menuCollectionView) {
      $0.backgroundColor = .clear
      $0.isUserInteractionEnabled = true
      $0.snp.makeConstraints {
        $0.top.equalTo(self.titleImageView.snp.bottom).offset(13.6)
        $0.width.equalTo(self.view.frame.height*244/375)
        $0.leading.equalTo(self.titleImageView.snp.leading).offset(-3)
        $0.height.equalTo(30)
      }
    }
  }
  func layoutMainCointContainerView() {
    self.topView.add(mainCoinContainerView) {
      $0.backgroundColor = .white
      $0.layer.applyShadow(color: .black, alpha: 0.12, x: 0, y: 0, blur: 8)
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.view.snp.centerX)
        $0.leading.equalTo(self.topView.snp.leading).offset(31)
        $0.top.equalTo(self.menuCollectionView.snp.bottom).offset(24)
        $0.height.equalTo(self.view.frame.width*169/375)
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
        $0.trailing.equalTo(self.mainCoinKoreanTitleLabel.snp.leading).offset(-8)
      }
    }
  }
  func layoutMainCoinTitleLogoView() {
    self.mainCoinContainerView.add(mainCoinTitleLogoView) {
      $0.image = UIImage(named: "coinIcon")
      $0.snp.makeConstraints {
        $0.trailing.equalTo(self.mainCoinEnglishTitleLabel.snp.leading).offset(-4)
        $0.centerY.equalTo(self.mainCoinEnglishTitleLabel.snp.centerY)
        $0.top.equalTo(self.mainCoinEnglishTitleLabel.snp.top).offset(5)
        $0.height.equalTo(self.mainCoinTitleLogoView.snp.width)
      }
    }
  }
  func layoutMainCoinPriceLabel() {
    self.mainCoinContainerView.add(mainCoinPriceLabel) {
      $0.setLabel(text: "1,900.0", textColor: .black, font: UIFont.systemFont(ofSize: 20, weight: .bold))
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.mainCoinContainerView.snp.centerX)
        $0.top.equalTo(self.mainCoinEnglishTitleLabel.snp.bottom).offset(8)
      }
    }
  }
  func layoutMainCoinStateContainerView() {
    self.mainCoinContainerView.add(mainCointStateContainerView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.centerX.equalTo(self.mainCoinContainerView.snp.centerX)
        $0.top.equalTo(self.mainCoinPriceLabel.snp.bottom).offset(13)
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
  func layoutFavoriteTableHeaderInputViews() {
    self.favoriteTableHeaderView.add(favoriteTitleLabel) {
      $0.setLabel(text: "나의 관심 코인", textColor: .black, font: .notoSansKRBoldFont(fontSize: 16))
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.favoriteTableHeaderView.snp.leading).offset(20)
        $0.top.equalTo(self.favoriteTableHeaderView.snp.top)
      }
    }
    self.favoriteTableHeaderView.add(favoriteAddButton) {
      $0.setBackgroundImage(UIImage(named: "add"), for: .normal)
      $0.snp.makeConstraints {
        $0.trailing.equalTo(self.favoriteTableHeaderView.snp.trailing).offset(-20)
        $0.centerY.equalTo(self.favoriteTitleLabel.snp.centerY)
        $0.top.equalTo(self.favoriteTitleLabel.snp.top)
        $0.width.equalTo(self.view.frame.width*54/375)
      }
    }
  }
  func layoutFavoriteTableView() {
    self.view.add(favoriteTableView) {
      $0.backgroundColor = .white
      $0.estimatedRowHeight = 1000
      $0.rowHeight = UITableView.automaticDimension
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.separatorStyle = .none
      $0.snp.makeConstraints {
        $0.top.equalTo(self.mainCoinContainerView.snp.bottom).offset(16)
        $0.leading.equalTo(self.view.snp.leading)
        $0.trailing.equalTo(self.view.snp.trailing)
        $0.bottom.equalTo(self.view.snp.bottom)
      }
    }
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
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
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) ->
  Int {
    return self.menuTitles.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let menuCell =
            collectionView.dequeueReusableCell(
              withReuseIdentifier: TopMenuCollectionViewCell.identifier,
              for: indexPath)
            as? TopMenuCollectionViewCell else { return UICollectionViewCell()}
    menuCell.awakeFromNib()
    menuCell.titleLabel.setLabel(text: self.menuTitles[indexPath.item],
                                 textColor: .white,
                                 font: .notoSansKRBoldFont(fontSize: 16))
    if indexPath.item == HomeViewController.menuIndex {
      menuCell.underLineView.isHidden = false
    }
    return menuCell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.item == 1 {
      HomeViewController.menuIndex = 1
      let transactionViewController = TransactionViewController()
      self.navigationController?.pushViewController(transactionViewController, animated: false)
    }
  }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 250
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = self.favoriteTableHeaderView
    headerView.snp.makeConstraints {
      $0.width.equalTo(self.view.frame.width)
      $0.height.equalTo(self.view.frame.width*33/375)
    }
    self.layoutFavoriteTableHeaderInputViews()
    return self.favoriteTableHeaderView
  }
  
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.coinModel.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let favoriteCell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.identifier, for: indexPath) as? FavoriteTableViewCell else { return UITableViewCell() }
    print(favoriteCell)
    favoriteCell.awakeFromNib()
    favoriteCell.dataBind(coinLogoImageName: self.coinModel[indexPath.row].coinLogoImageName, coinEnglishTitle: self.coinModel[indexPath.row].coinEnglishTitle, coinKoreanTitle: self.coinModel[indexPath.row].coinKoreanTitle, coinPrice: self.coinModel[indexPath.row].coinPrice, riseOrDescent: self.coinModel[indexPath.row].riseOrDescent, degree: self.coinModel[indexPath.row].degree, percentage: self.coinModel[indexPath.row].percentage, graphImageName: self.coinModel[indexPath.row].graphImageName)
    return favoriteCell
  }
  
  
}
