//
//  NetworkingAPI.swift
//  TodaytiCon
//
//  Created by 정창용 on 2020/12/09.
//

import Foundation
import Alamofire

enum NetworkingAPI {
    case timeLine(_ size: Int, _ base_time: String)
    
    case createCaring(_ caring: String, image: [String?])
    case detailCaring(_ id: String)
    case deleteCaring(_ id: String)
    
    var path: String {
        switch self {
        case .timeLine:
                return "/timeline"
            
        case .createCaring:
            return "/caring"
            
        case .detailCaring(let id), .deleteCaring(let id):
            return "/caring/" + id
            
        }
        
    }
    
    var headers: HTTPHeaders? {
        let defaultToken: String = "accessToken"
        let userDefault = UserDefaults.standard
        
        userDefault.set(defaultToken, forKey: "accessToken")
        userDefault.synchronize()
        
        guard let token = userDefault.string(forKey: "accessToken") else { return nil }
        
        return ["Authorization" : "Bearer" + token]
        
    }
    
    var parameters: [String : Any] {
        switch self {
        case .timeLine(let size, let last_caring_id):
            return ["size": size, "last_caring_id": last_caring_id]
            
        case .createCaring(let caring, let image):
            return ["caring": caring, "image":image]
            
        default:
            return [:]
        }
        
    }
    
}

