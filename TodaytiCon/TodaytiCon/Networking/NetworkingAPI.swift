//
//  NetworkingAPI.swift
//  TodaytiCon
//
//  Created by 장서영 on 2020/12/14.
//

import Foundation
import Alamofire

enum NetworkingAPI{
    case Login(_ email : String, _ password : String)
    case refreshToken
    case SignUp(_ name : String, _ email : String, _ password : String)
    
    var path : String {
        switch  self {
        case .Login, .refreshToken :
            return "/user/auth"
        
        case .SignUp :
            return "/user/"
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .Login, .SignUp:
            return nil
            
        case .refreshToken:
            let refreshToken : String = "token"
            let UserDefault = UserDefaults.standard
            UserDefault.set(refreshToken, forKey: "refreshToken")
            UserDefault.synchronize()
            guard  let token = UserDefault.string(forKey: "refreshToken") else { return nil }
            return ["Authorization" : "Bearer" + token]
            
        default:
            let defaultToken : String = "accessToken"
            let UserDefault = UserDefaults.standard
            UserDefault.set(defaultToken, forKey: "accessToken")
            UserDefault.synchronize()
            guard let token = UserDefault.string(forKey: "accessToken") else { return nil }
            let headers = [
                "Authorization" : String (format : "Bearer : @%", token
                )
            ]
            return ["Authorization" : "Bearer" + token]
            
            }
        }
    var parameters: [String : Any]{
        switch self {
        case .Login(let email, let password):
            print(["email": email, "password": password])
            return ["email": email, "password": password]
            
        case .SignUp(let name, let email, let password):
            print(["email": email, "password": password])
            return ["name": name, "email" : email, "password" : password]
            
        default:
            return [:]
            
        }
    }
        
}
