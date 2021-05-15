//
//  UIView+.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/15.
//

import UIKit

extension UIView {
  func setBorder(borderColor : UIColor?, borderWidth : CGFloat?) {
    
    // UIView 의 테두리 색상 설정
    if let borderColor_ = borderColor {
      self.layer.borderColor = borderColor_.cgColor
    } else {
      // borderColor 변수가 nil 일 경우의 default
      self.layer.borderColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0).cgColor
    }
    
    // UIView 의 테두리 두께 설정
    if let borderWidth_ = borderWidth {
      self.layer.borderWidth = borderWidth_
    } else {
      // borderWidth 변수가 nil 일 경우의 default
      self.layer.borderWidth = 1.0
    }
    
  }
}
