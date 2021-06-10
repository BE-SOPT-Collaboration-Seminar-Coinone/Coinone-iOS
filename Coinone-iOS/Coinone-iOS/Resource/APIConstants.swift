//
//  APIConstants.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/06/02.
//

import Foundation

struct APIConstants {
  
  static let baseURL = "http://52.79.251.168:5000"
  
  static let addCoinURL = baseURL + "/api/add-coin"
  static let addUserURL = baseURL + "/api/add-user "
  static let myCoinURL = baseURL + "/api/my-coin"
  static let coinListURL = baseURL + "/api/coin-list"
}

struct APIIndex {
  
  var index: Index
  
  enum Index {
    case id(String)
    case userId(String)
    case sort(String, String)
    
    func getIndex() -> String {
      switch self {
      case .id(let index):
        return "/\(index)"
      case .userId(let index):
        return "/\(index)"
      case .sort(let sort, let ascending):
        return "/\(sort)/\(ascending)"
      }
    }
  }
}

// add-user
// let url = APIConstants.addUserURL + APIIndex.init(index: .userID(parameterName)).index.getIndex()

// my-coin
// let url = APIConstants.myCoinURL + APIIndex.init(index: .id(parameterName)).index.getIndex()

// coin-list
// let url = APIConstants.coinListURL + APIIndex.init(index: .sort(parameter1, parameter2)).index.getIndex()
