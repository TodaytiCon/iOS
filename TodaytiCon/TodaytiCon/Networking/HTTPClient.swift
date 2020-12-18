//
//  HTTPClient.swift
//  TodaytiCon
//
//  Created by 정창용 on 2020/12/09.
//

import Foundation
import Alamofire

protocol HTTPClientProvider {
    func get(_ api: NetworkingAPI) -> DataRequest
    func post(_ api: NetworkingAPI) -> DataRequest
    func put(_ api: NetworkingAPI) -> DataRequest
    func delete(_ api: NetworkingAPI) -> DataRequest
    
}

class HTTPClient: HTTPClientProvider {
    let baseURI = "http://caratserver.pythonanywhere.com"
    
    func get(_ api: NetworkingAPI) -> DataRequest {
        return AF.request(baseURI + api.path, method: .get, parameters: api.parameters, encoding: JSONEncoding.prettyPrinted, headers: api.headers, interceptor: nil)
        
    }
    
    func post(_ api: NetworkingAPI) -> DataRequest {
        print(baseURI+api.path)
        print(api.parameters)
        print(api.headers)
        
        return AF.request(baseURI + api.path, method: .post, parameters: api.parameters, encoding: URLEncoding.default, headers: api.headers, interceptor: nil)
        
    }

    func put(_ api: NetworkingAPI) -> DataRequest {
        return AF.request(baseURI + api.path, method: .put, parameters: api.parameters, encoding: JSONEncoding.prettyPrinted, headers: api.headers, interceptor: nil)
        
    }
    
    func delete(_ api: NetworkingAPI) -> DataRequest {
        return AF.request(baseURI + api.path, method: .delete, parameters: api.parameters, encoding: JSONEncoding.prettyPrinted, headers: api.headers, interceptor: nil)
        
    }

}

