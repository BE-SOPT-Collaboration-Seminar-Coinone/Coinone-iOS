//
//  MyDataModel.swift
//  Coinone-iOS
//
//  Created by 김지수 on 2021/06/10.
//

import Foundation

// MARK: - My
struct MyDataModel: Codable {
    let id: String
    let coinLogoImage: String
    let coinEnglishTitle, coinKoreanTitle, coinCurrentPrice, riseOrDescent: String
    let degree, percentage, coinTotalPrice: String
    let graphImage: String
    

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case coinLogoImage, coinEnglishTitle, coinKoreanTitle, coinCurrentPrice, riseOrDescent, degree, percentage, coinTotalPrice, graphImage
    }
}
