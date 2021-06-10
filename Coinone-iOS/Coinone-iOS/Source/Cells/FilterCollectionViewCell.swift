//
//  FilterCollectionViewCell.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/20.
//
import SnapKit
import Then
import UIKit

// MARK: - FilterCollectionViewCell
class FilterCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Identifier
  let identifier = "FilterCollectionViewCell"
  static var titleTag = true
  static var currentPriceTag = true
  static var fluctuationTag = true
  static var totalPriceTag = true
  
  // MARK: - LifeCycles
  override func awakeFromNib() {
    super.awakeFromNib()
    layout()
  }
  
  // MARK: - Components
  let filterTitleLabel = UILabel()
  let filterButton = UIButton()
}
// MARK: - Extensions
extension FilterCollectionViewCell {
  // MARK: - Helpers
  func layout() {
    self.contentView.layer.borderWidth = 1
    self.contentView.layer.borderColor = CGColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    layoutFilterLabel()
    layoutFilterButton()
  }
  func layoutFilterLabel() {
    self.contentView.add(filterTitleLabel) {
      $0.snp.makeConstraints {
        $0.leading.equalTo(self.contentView.snp.leading).offset(8)
        $0.centerY.equalTo(self.contentView.snp.centerY)
      }
    }
  }
  func layoutFilterButton() {
    self.contentView.add(filterButton) {
      $0.setBackgroundImage(UIImage(named: "switch"), for: .normal)
      $0.setBackgroundImage(UIImage(named: "switchDown"), for: .selected)
      $0.snp.makeConstraints {
        $0.trailing.equalTo(self.contentView.snp.trailing).offset(-6)
        $0.centerY.equalTo(self.contentView.snp.centerY)
        $0.top.equalTo(self.filterTitleLabel.snp.top)
      }
    }
  }
  func dataBind(title: String) {
    self.filterTitleLabel.setLabel(text: title, textColor: .coinGray, font: .notoSansKRBoldFont(fontSize: 12))
  }
}
