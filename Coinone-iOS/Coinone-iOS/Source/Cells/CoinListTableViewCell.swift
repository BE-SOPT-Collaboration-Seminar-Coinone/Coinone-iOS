//
//  CoinListTableViewCell.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/20.
//
import SnapKit
import Then
import UIKit

// MARK: - CoinListTableViewCell
class CoinListTableViewCell: UITableViewCell {
  
  // MARK: - Identifier
  let identifier = "CoinListTableViewCell"
  
  // MARK: - LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    layout()
    
  }
  
  // MARK: - Components
  let containerView = UIView()
  let coinTitleContainerView = UIView()
  let coinTitleLogoImageView = UIImageView()
  let coinTitleEnglishLabel = UILabel()
  let coinTitleKoreanLabel = UILabel()
  
  let coinCurrentPriceLabel = UILabel()
  let coinFluctuationDegreeLabel = UILabel()
  let coinTotalPriceLabel = UILabel()
}

// MARK: - Extensions
extension CoinListTableViewCell {
  
  // MARK: - Helpers
  func layout() {
    self.backgroundColor = .clear
    layoutContainerView()
    layoutCoinTitleContainerView()
    layoutCoinTitleEnglishLabel()
    layoutCoinTitleLogoImageView()
    layoutCoinTitleKoreanLabel()
    layoutCoinTotalPriceLabel()
    layoutCoinFluctuationDegreeLabel()
    layoutCoinCurrentPriceLabel()
  }
  func layoutContainerView() {
    self.contentView.add(containerView) {
      $0.backgroundColor = .white
      $0.snp.makeConstraints {
        $0.top.equalTo(self.contentView.snp.top).offset(6)
        $0.leading.equalTo(self.contentView.snp.leading).offset(20)
        $0.trailing.equalTo(self.contentView.snp.trailing).offset(-20)
        $0.bottom.equalTo(self.contentView.snp.bottom).offset(-6)
      }
    }
  }
  func layoutCoinTitleContainerView() {
    self.containerView.add(coinTitleContainerView) {
      $0.backgroundColor = .clear
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.containerView.snp.leading).offset(13)
        $0.centerY.equalToSuperview()
        $0.height.equalTo(34)
        $0.width.equalTo(50)
      }
    }
  }
  func layoutCoinTitleEnglishLabel() {
    self.coinTitleContainerView.add(coinTitleEnglishLabel) {
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.coinTitleContainerView.snp.leading).offset(22)
        $0.top.equalTo(self.coinTitleContainerView.snp.top)
      }
    }
  }
  func layoutCoinTitleLogoImageView() {
    self.coinTitleContainerView.add(coinTitleLogoImageView) {
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.coinTitleContainerView.snp.leading)
        $0.bottom.equalTo(self.coinTitleEnglishLabel.snp.bottom).offset(-3)
        $0.width.height.equalTo(11)
      }
    }
  }
  func layoutCoinTitleKoreanLabel() {
    self.coinTitleContainerView.add(coinTitleKoreanLabel) {
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.coinTitleEnglishLabel.snp.leading)
        $0.top.equalTo(self.coinTitleEnglishLabel.snp.bottom)
      }
    }
  }
  func layoutCoinTotalPriceLabel() {
    self.containerView.add(coinTotalPriceLabel) {
      $0.snp.makeConstraints {
        $0.trailing.equalTo(self.containerView.snp.trailing).offset(-10)
        $0.centerY.equalTo(self.containerView.snp.centerY)
      }
    }
  }
  func layoutCoinFluctuationDegreeLabel() {
    self.containerView.add(coinFluctuationDegreeLabel) {
      $0.snp.makeConstraints {
        $0.trailing.equalTo(self.coinTotalPriceLabel.snp.trailing).offset(-70)
        $0.centerY.equalTo(self.containerView.snp.centerY)
      }
    }
  }
  func layoutCoinCurrentPriceLabel() {
    self.containerView.add(coinCurrentPriceLabel) {
      $0.snp.makeConstraints {
        $0.trailing.equalTo(self.coinTotalPriceLabel.snp.trailing).offset(-144)
        $0.centerY.equalTo(self.containerView.snp.centerY)
      }
    }
  }
  
  func dataBind(coinLogoImageName: String, coinEnglishTitle: String, coinKoreanTitle: String, coinCurrentPrice: String, riseOrDescent: String, percentage: String, coinTotalPrice: String) {
    self.coinTitleLogoImageView.imageFromUrl(coinLogoImageName, defaultImgPath: "https://sopt-8-coinone.s3.ap-northeast-2.amazonaws.com/KLAY.png")
    self.coinTitleEnglishLabel.setLabel(text: coinEnglishTitle, textColor: .black, font: .notoSansKRBoldFont(fontSize: 14))
    self.coinTitleKoreanLabel.setLabel(text: coinKoreanTitle, textColor: .coinGray, font: .notoSansKRMediumFont(fontSize: 10))
    if riseOrDescent == "+" {
      self.coinCurrentPriceLabel.setLabel(text: coinCurrentPrice, textColor: .textRed, font: .boldSystemFont(ofSize: 14))
      self.coinFluctuationDegreeLabel.setLabel(text: "\(riseOrDescent)\(percentage)%", textColor: .textRed, font: .systemFont(ofSize: 14, weight: .regular))
    }
    else {
      self.coinCurrentPriceLabel.setLabel(text: coinCurrentPrice, textColor: .mainBlue, font: .boldSystemFont(ofSize: 14))
      self.coinFluctuationDegreeLabel.setLabel(text: "\(riseOrDescent)\(percentage)%", textColor: .mainBlue, font: .systemFont(ofSize: 14, weight: .regular))
    }
    self.coinTotalPriceLabel.setLabel(text: "\(coinTotalPrice.dropLast(8))억", textColor: .coinGray, font: .systemFont(ofSize: 14, weight: .regular))
  }
}
