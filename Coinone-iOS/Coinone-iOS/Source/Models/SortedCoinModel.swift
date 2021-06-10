//
//  SortedCoinModel.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/06/02.
//

import Foundation

// MARK: - SortedCoin
struct SortedCoin: Codable {
  let id: String
  let coinLogoImage: String
  let coinEnglishTitle, coinKoreanTitle, coinCurrentPrice, riseOrDescent: String
  let degree, percentage, coinTotalPrice: String
  let graphImage: String
  let v: Int
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case coinLogoImage, coinEnglishTitle, coinKoreanTitle, coinCurrentPrice, riseOrDescent, degree, percentage, coinTotalPrice, graphImage
    case v = "__v"
  }
}

