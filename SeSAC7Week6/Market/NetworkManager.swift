//
//  NetworkManager.swift
//  SeSAC7Week6
//
//  Created by Jack on 8/6/25.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
     
    func callRequest(completionHandler: @escaping ([Coin]) -> Void) {
        let url = "https://api.upbit.com/v1/market/all"
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [Coin].self) { response in
                print(#function, "두번째")
                switch response.result {
                case .success(let value):
                    print("success", value)
                    completionHandler(value)
                case .failure(let error):
                    print("fail", error)
                }
            }
        print(#function, "세번째")
    }
    
}

