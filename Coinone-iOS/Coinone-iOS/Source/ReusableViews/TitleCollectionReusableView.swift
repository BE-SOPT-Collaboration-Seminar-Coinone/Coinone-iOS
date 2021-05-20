//
//  TitleCollectionReusableView.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/20.
//
import SnapKit
import Then
import UIKit

// MARK: - TitleCollectionReusableView
class TitleCollectionReusableView: UICollectionReusableView {
  
  // MARK: - Identifier
  let identifier = "TitleCollectionReusableView"
  
  // MARK: - LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    layout()
  }
  
  // MARK: - Components
  let logoImageView = UIImageView()
  let searchButton = UIButton()
}

// MARK: - Extensions
extension TitleCollectionReusableView {
  
  // MARK: - Helpers
  func layout() {
    layoutLogoImageView()
    layoutSearchButton()
  }
  func layoutLogoImageView() {
    self.add(logoImageView) {
      $0.image = UIImage(named: "logoOnwhite")
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.snp.leading).offset(20)
        $0.centerY.equalTo(self.snp.centerY)
        $0.width.equalTo(self.frame.width*98/375)
        $0.height.equalTo(self.frame.width*19/375)
      }
    }
  }
  func layoutSearchButton() {
    self.add(searchButton) {
      $0.setBackgroundImage(UIImage(named: "searchOnwhite"), for: .normal)
      $0.snp.makeConstraints {
        $0.trailing.equalTo(self.snp.trailing).offset(-20)
        $0.centerY.equalTo(self.snp.centerY)
        $0.width.height.equalTo(self.frame.width*16/375)
      }
    }
  }
}
