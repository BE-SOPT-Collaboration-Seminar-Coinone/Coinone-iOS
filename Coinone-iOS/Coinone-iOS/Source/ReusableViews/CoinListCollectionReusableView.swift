//
//  CoinListCollectionReusableView.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/20.
//
import Alamofire
import SnapKit
import Then
import UIKit

// MARK: - CoinListCollectionReusableView
class CoinListCollectionReusableView: UICollectionReusableView {
  
  // MARK: - Identifier
  let identifier = "CoinListCollectionReusableView"
  var sort = "total-price"
  var ascending = "-1"
  
  // MARK: - LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    register()
    layout()
    self.coinListTableView.delegate = self
    self.coinListTableView.dataSource = self
  }
  
  // MARK: - Components
  let coinListTableView = UITableView()
  var coinModel: [CoinListModel] = []
}

// MARK: - Extensions
extension CoinListCollectionReusableView {
  func register() {
    self.coinListTableView.register(CoinListTableViewCell.self, forCellReuseIdentifier: CoinListTableViewCell.identifier)
  }
  func layout() {
    self.backgroundColor = .clear
    layoutCoinListTableView()
  }
  func layoutCoinListTableView() {
    self.add(coinListTableView) {
      $0.estimatedRowHeight = 75
      $0.rowHeight = UITableView.automaticDimension
      $0.backgroundColor = .tableViewGray
      $0.separatorStyle = .none
      $0.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }
  func setInitialList(sort: String, ascending: String) {
    CoinFilterService.shared.sortCoin(sort: sort, ascending: ascending) {
      (networkResult) in
      switch(networkResult) {
      case .success(let data):
        var tempCoinList:[CoinListModel] = []
        guard let data = data as? [SortedCoin] else {return}
        for i in 0..<data.count {
          tempCoinList.append(CoinListModel(coinLogoImageName: data[i].coinLogoImage,
                                            coinEnglishTitle: data[i].coinEnglishTitle,
                                            coinKoreanTitle: data[i].coinKoreanTitle,
                                            coinCurrentPrice: data[i].coinCurrentPrice,
                                            riseOrDescent: data[i].riseOrDescent,
                                            percentage: data[i].percentage,
                                            coinTotalPrice: data[i].coinTotalPrice))
        }
        self.coinModel = tempCoinList
        self.coinListTableView.reloadData()
      case .networkFail:
        print("networkFail")
      case .pathErr:
        print("pathErr")
      case .requestErr:
        print("requestErr")
      case .serverErr:
        print("serverErr")
      }
    }
  }
}

extension CoinListCollectionReusableView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 75
  }
}

extension CoinListCollectionReusableView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.coinModel.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let coinListCell = tableView.dequeueReusableCell(withIdentifier: CoinListTableViewCell.identifier, for: indexPath) as? CoinListTableViewCell else {
      return UITableViewCell()
    }
    coinListCell.dataBind(coinLogoImageName: self.coinModel[indexPath.row].coinLogoImageName,
                          coinEnglishTitle: self.coinModel[indexPath.row].coinEnglishTitle,
                          coinKoreanTitle: self.coinModel[indexPath.row].coinKoreanTitle,
                          coinCurrentPrice: self.coinModel[indexPath.row].coinCurrentPrice,
                          riseOrDescent: self.coinModel[indexPath.row].riseOrDescent,
                          percentage: self.coinModel[indexPath.row].percentage,
                          coinTotalPrice: self.coinModel[indexPath.row].coinTotalPrice)
    coinListCell.awakeFromNib()
    return coinListCell
  }
  
  
}
