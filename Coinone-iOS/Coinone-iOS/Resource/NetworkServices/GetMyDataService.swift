//
//  GetMyDataService.swift
//  Coinone-iOS
//
//  Created by 김지수 on 2021/06/10.
//

import Foundation
import Alamofire


struct GetMyDataService
{
    static let shared = GetMyDataService()
    
    
    
    func getMyInfo(completion : @escaping (NetworkResult<Any>) -> Void)
    {
        // completion 클로저를 @escaping closure로 정의합니다.
        
        
        let URL = "http://3.35.8.123:5000/api/my-coin/1"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(URL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        
        dataRequest.responseData { dataResponse in
            
            print("서버 결과")
            switch dataResponse.result {
            case .success:
                                
                print("@@@@@")
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
       
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure:
                print("서버 실패")
                completion(.pathErr)
                
            }
        }
                                            
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
          
        switch statusCode {
        
        case 200: return isValidData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    
    
    private func isValidData(data : Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()

        
        guard let decodedData = try? decoder.decode(MyDataModel.self, from: data)
        else { return .pathErr}
        

        // 우선 MyDataModel 형태로 decode(해독)을 한번 거칩니다. 실패하면 pathErr
        
        // 해독에 성공하면 My data를 success에 넣어줍니다.
        
        return .success(decodedData.coin)
       

    }
    
}
