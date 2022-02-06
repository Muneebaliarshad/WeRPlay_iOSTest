//
//  NetworkConstants.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 06/02/2022.
//

import Foundation
import Alamofire

struct Servers {
    static let BaseURL = "https://dog.ceo/api"
    
    static func baseURLWith(route: String) -> String {
        return BaseURL + route
    }
    
    static func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}


enum Route: String {
    case list = "/breeds/list/all"
}
