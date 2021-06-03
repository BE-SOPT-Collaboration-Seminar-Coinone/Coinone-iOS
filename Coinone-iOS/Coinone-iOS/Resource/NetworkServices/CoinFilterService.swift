//
//  CoinFilterService.swift
//  Coinone-iOS
//
//  Created by 노한솔 on 2021/06/02.
//

import Alamofire
import Foundation

struct CoinFilterService {
  static let shared = CoinFilterService()
  
  func sortCoin(sort: String,
             ascending: String,
             completion: @escaping (NetworkResult<Any>) -> Void) {
    let header: HTTPHeaders = ["Content-Type": "application/json"]
    let url = APIConstants.coinListURL + APIIndex.init(index: .sort(sort, ascending)).index.getIndex()
    let dataRequest = AF.request(url,
                                 method: .get,
                                 encoding: JSONEncoding.default,
                                 headers: header)
    
    dataRequest.responseData { dataResponse in
      dump(dataResponse)
      switch dataResponse.result {
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else {return}
        guard let value = dataResponse.value else {return}
        let networkResult = self.judgeStatus(by: statusCode, value)
        completion(networkResult)
      case .failure:
        completion(.pathErr)
      }
    }
  }
  
  private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(SortedCoin.self, from: data) else {return .pathErr}
    switch statusCode {
    case 200: return .success
    case 400: return .requestErr
    case 500: return .serverErr
    default: return .networkFail
    }
  }
}

