//
//  CALayer+.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/15.
//

import UIKit

extension CALayer {
  func applyShadow(
    color: UIColor = UIColor(red: 135/255, green: 135/255, blue: 135/255, alpha: 0.02),
    alpha: Float = 0.5,
    x: CGFloat = 2,
    y: CGFloat = 2,
    blur: CGFloat = 4
  ) {
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 1.0
  }
}
