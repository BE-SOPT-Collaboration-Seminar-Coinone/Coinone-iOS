//
//  FavoriteTableViewCell.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/19.
//
import SnapKit
import Then
import UIKit

// MARK: - FavoriteTableViewCell
class FavoriteTableViewCell: UITableViewCell {
  
  // MARK: - Identifier
  let identifier = "FavoriteTableViewCell"
  
  // MARK: - LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    layout()
  }
  
  let coinTitleContainerView = UIView()
  let coinLogoView = UIImageView()
  let coinTitleEnglishLabel = UILabel()
  let coinTitleKoreanLabel = UILabel()
  
  let coinPriceLabel = UILabel()
  
  let coinFluctuationContainerView = UIView()
  let coinFluctuationImageView = UIImageView()
  let coinFluctuationDegreeLabel = UILabel()
  let coinFluctuationPercentageLabel = UILabel()
  
  let coinGraphImageView = UIImageView()
}

// MARK: - Extensions
extension FavoriteTableViewCell {
  // MARK: - Helpers
  func layout() {
    layoutCoinTitleContainerView()
    layoutCoinLogoView()
    layoutCoinTitleEnglishLabel()
    layoutCoinTitleKoreanLabel()
    layoutCoinPriceLabel()
    layoutCoinFluctuationContainerView()
    layoutCoinFluctuationImageView()
    layoutCoinFluctuationDegreeLabel()
    layoutCoinFluctuationPercentageLabel()
    layoutCoinGraphImageView()
  }
  func layoutCoinTitleContainerView() {
    self.contentView.add(coinTitleContainerView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.top.equalTo(self.contentView.snp.top).offset(12)
        $0.leading.equalTo(self.contentView.snp.leading).offset(16)
        $0.width.equalTo(self.contentView.frame.width*104/375)
        $0.height.equalTo(self.contentView.frame.width*22/375)
      }
    }
  }
  func layoutCoinLogoView() {
    self.coinTitleContainerView.add(coinLogoView) {
      $0.image = UIImage(named: "coinIcon")
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.coinTitleContainerView.snp.leading)
        $0.centerY.equalTo(self.coinTitleContainerView.snp.centerY)
        $0.width.height.equalTo(13)
      }
    }
  }
  func layoutCoinTitleEnglishLabel() {
    self.coinTitleContainerView.add(coinTitleEnglishLabel) {
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.coinTitleContainerView.snp.centerY)
        $0.leading.equalTo(self.coinLogoView.snp.trailing).offset(4)
      }
    }
  }
  func layoutCoinTitleKoreanLabel() {
    self.coinTitleContainerView.add(coinTitleKoreanLabel) {
      $0.snp.makeConstraints {
        $0.centerY.equalTo(self.coinTitleContainerView.snp.centerY)
        $0.leading.equalTo(self.coinTitleEnglishLabel.snp.trailing).offset(4)
      }
    }
  }
  func layoutCoinPriceLabel() {
    self.contentView.add(coinPriceLabel) {
      $0.snp.makeConstraints {
        $0.top.equalTo(self.coinTitleContainerView.snp.bottom).offset(6)
        $0.leading.equalTo(self.coinTitleContainerView.snp.leading)
      }
    }
  }
  func layoutCoinFluctuationContainerView() {
    self.contentView.add(coinFluctuationContainerView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.coinPriceLabel.snp.trailing).offset(16)
        $0.top.equalTo(self.contentView.snp.top).offset(46)
        $0.width.equalTo(self.contentView.frame.width*101/375)
        $0.height.equalTo(self.contentView.frame.width*19/375)
      }
    }
  }
  func layoutCoinFluctuationImageView() {
    self.coinFluctuationContainerView.add(coinFluctuationImageView) {
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.coinFluctuationContainerView.snp.leading)
        $0.centerY.equalTo(self.coinFluctuationContainerView.snp.centerY)
        $0.width.height.equalTo(6)
      }
    }
  }
  func layoutCoinFluctuationDegreeLabel() {
    self.coinFluctuationContainerView.add(coinFluctuationDegreeLabel) {
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.coinFluctuationImageView.snp.trailing).offset(5)
        $0.bottom.equalTo(self.coinFluctuationContainerView.snp.bottom)
      }
    }
  }
  func layoutCoinFluctuationPercentageLabel() {
    self.coinFluctuationContainerView.add(coinFluctuationPercentageLabel) {
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.coinFluctuationDegreeLabel.snp.trailing).offset(6)
        $0.centerY.equalTo(self.coinFluctuationDegreeLabel.snp.centerY)
      }
    }
  }
  func layoutCoinGraphImageView() {
    self.contentView.add(coinGraphImageView) {
      $0.snp.makeConstraints {
        $0.leading.trailing.bottom.equalToSuperview()
        $0.top.equalTo(self.coinFluctuationContainerView.snp.bottom).offset(10)
        $0.height.equalTo(81)
      }
    }
  }
  func dataBind(coinLogoImageName: String, coinEnglishTitle: String, coinKoreanTitle: String, coinPrice: String, riseOrDescent: String, degree: String, percentage: String, graphImageName: String) {
    self.coinLogoView.image = UIImage(named: coinLogoImageName)
    self.coinTitleEnglishLabel.setLabel(text: coinEnglishTitle, textColor: .black, font: .notoSansKRBoldFont(fontSize: 14))
    self.coinTitleKoreanLabel.setLabel(text: coinKoreanTitle, textColor: .coinGray, font: .notoSansKRMediumFont(fontSize: 11))
    self.coinPriceLabel.setLabel(text: coinPrice, textColor: .black, font: .notoSansKRBoldFont(fontSize: 20))
    self.coinFluctuationImageView.image = UIImage(named: riseOrDescent)
    self.coinFluctuationDegreeLabel.setLabel(text: degree, textColor: .textRed, font: .boldSystemFont(ofSize: 14))
    self.coinFluctuationPercentageLabel.setLabel(text: percentage, textColor: .textRed, font: UIFont.systemFont(ofSize: 14, weight: .medium))
    self.coinGraphImageView.image = UIImage(named: graphImageName)
  }
}
