//
//  NetworkResult.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/06/02.
//

import Foundation

enum NetworkResult<T> {
  case success
  case requestErr
  case pathErr
  case serverErr
  case networkFail
}
