//
//  TopMenuCollectionViewCell.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/18.
//
import SnapKit
import Then
import UIKit

// MARK: - TopMenuCollectionViewCell
class TopMenuCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Identifier
  let identifier = "TopMenuCollectionViewCell"
  
  // MARK: - LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    layout()
  }
  
  // MARK: - Components
  let titleLabel = UILabel()
  let underLineView = UIView()
}

// MARK: - Extensions
extension TopMenuCollectionViewCell {
  // MARK: - Helpers
  func layout() {
    layoutMenu()
  }
  func layoutMenu() {
    self.contentView.add(titleLabel) {
      $0.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.top.equalToSuperview()
      }
    }
    self.contentView.add(underLineView) {
      $0.layer.cornerRadius = 3
      $0.backgroundColor = .white
      $0.isHidden = true
      $0.snp.makeConstraints {
        $0.bottom.equalTo(self.contentView.snp.bottom)
        $0.leading.equalTo(self.titleLabel.snp.leading)
        $0.trailing.equalTo(self.titleLabel.snp.trailing)
        $0.height.equalTo(2)
      }
    }
  }
}
