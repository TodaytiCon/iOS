//
//  HTTP client.swift
//  TodaytiCon
//
//  Created by 장서영 on 2020/12/14.
//

import Foundation
import Alamofire

protocol HTTPCleintprovider {
    func post(_ API : NetworkingAPI)->DataRequest
}

class HTTPClient : HTTPCleintprovider{
    
    func post(_ API: NetworkingAPI) -> DataRequest {
        print("http://caratserver.pythonanywhere.com"+API.path)
        print(API.parameters)
        print(API.headers)
        
        return AF.request("http://caratserver.pythonanywhere.com" + API.path, method: .post, parameters: API.parameters, encoding: URLEncoding.default, headers: API.headers, interceptor: nil)
    }
    
}
