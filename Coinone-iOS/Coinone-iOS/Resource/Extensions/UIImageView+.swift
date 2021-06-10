//
//  UIImageView+.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/06/10.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
  public func imageFromUrl(_ urlString: String?, defaultImgPath : String?) {
    
    let tmpUrl : String?
    if urlString == nil {
      tmpUrl = ""
    } else  {
      tmpUrl = urlString
    }
    if let url = tmpUrl, let defaultURL : String = defaultImgPath {
      if url.isEmpty {
        self.kf.setImage(with: URL(string: defaultURL), options: [.transition(ImageTransition.fade(0.5))])
      } else {
        self.kf.setImage(with: URL(string: url), options: [.transition(ImageTransition.fade(0.5))])
      }
    }
  }
}
