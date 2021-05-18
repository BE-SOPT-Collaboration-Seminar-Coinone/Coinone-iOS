//
//  Identifiable.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/05/18.
//

import Foundation
import UIKit

protocol Identifiable {
  static var identifier: String { get }
}

extension Identifiable {
  static var identifier: String {
    return String(describing: self)
  }
}
extension UITableViewCell: Identifiable {}
extension UICollectionViewCell: Identifiable {}
extension UIViewController: Identifiable {}
