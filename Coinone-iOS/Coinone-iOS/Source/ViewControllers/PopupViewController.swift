//
//  PopupViewController.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/19.
//

import UIKit

// MARK: - PopupViewController
class PopupViewController: UIViewController {
  
  // MARK: - LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
  }
 
  // MARK: - Properties
  let popupView = UIView()
  let popupImageView = UIImageView()
  let notToSeeAgainButton = UIButton()
  let closeButton = UIButton()
  let titleLabel = UILabel()
  let contentLabel = UILabel()
}

// MARK: - Extensions
extension PopupViewController {
  
  // MARK: - Helpers
  func layout() {
    self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    layoutPopupView()
    layoutPopupImageView()
    layoutNotToSeeAgainButton()
    layoutCloseButton()
    layoutTitleLabel()
    layoutContentLabel()
  }
  func layoutPopupView() {
    self.view.add(popupView) {
      $0.backgroundColor = .white
      $0.snp.makeConstraints {
        $0.center.equalTo(self.view.snp.center)
        $0.width.equalTo(self.view.frame.width*286/375)
        $0.height.equalTo(self.view.frame.width*349/375)
      }
    }
  }
  func layoutPopupImageView() {
    self.popupView.add(popupImageView) {
      $0.image = UIImage(named: "picture")
      $0.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }
  func layoutNotToSeeAgainButton() {
    self.popupView.add(notToSeeAgainButton) {
      $0.setTitle("다시 보지 않기", for: .normal)
      $0.setTitleColor(.textGray, for: .normal)
      $0.backgroundColor = .white
      $0.titleLabel?.font = .notoSansKRLightFont(fontSize: 12)
      $0.titleLabel?.textAlignment = .center
      $0.snp.makeConstraints {
        $0.leading.bottom.equalToSuperview()
        $0.trailing.equalTo(self.popupView.snp.centerX)
        $0.height.equalTo(self.view.frame.width*43/375)
      }
    }
  }
  func layoutCloseButton() {
    self.popupView.add(closeButton) {
      $0.setTitle("닫기", for: .normal)
      $0.setTitleColor(.black, for: .normal)
      $0.backgroundColor = .white
      $0.titleLabel?.font = .notoSansKRLightFont(fontSize: 12)
      $0.titleLabel?.textAlignment = .center
      $0.addTarget(self, action: #selector(self.backButtonClicked), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.trailing.bottom.equalToSuperview()
        $0.leading.equalTo(self.popupView.snp.centerX)
        $0.height.equalTo(self.view.frame.width*43/375)
      }
    }
  }
  func layoutTitleLabel() {
    self.popupView.add(titleLabel) {
      $0.setLabel(text: "신규상장", textColor: .textGray, font: .notoSansKRLightFont(fontSize: 18))
      $0.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.top.equalTo(self.popupView.snp.top).offset(35)
      }
    }
  }
  func layoutContentLabel() {
    self.popupView.add(contentLabel) {
      $0.setLabel(text: "바이오패스포트(BIOT)", textColor: .white, font: .notoSansKRBoldFont(fontSize: 18))
      $0.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.top.equalTo(self.titleLabel.snp.bottom).offset(3)
      }
    }
  }
  @objc func backButtonClicked() {
    self.dismiss(animated: false, completion: nil)
  }
}
