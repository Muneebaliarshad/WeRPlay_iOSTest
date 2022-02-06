//
//  Service.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 06/02/2022.
//

import Foundation
import Alamofire
import SwiftUI

enum APIString: String {
    case Success = "✅✅✅✅✅"
    case Failure = "❌❌❌❌❌"
}


class Service: NSObject  {
    
    //MARK: - Properties
    var sessionManager : Session!
    var accessToken:String? = nil
    static let `default` = Service()
    
    
    //MARK: - init
    override init() {
        let configuration = Session.default.session.configuration
        configuration.timeoutIntervalForRequest = 15
        configuration.timeoutIntervalForResource = 15
        sessionManager = Session(configuration: configuration)
    }
    
    
    func getAuthorizationHeader() -> HTTPHeaders {
        return ["Content-Type":"application/json"]
    }
    
    
    //MARK: - Helper Methods
    func execute<T>(serviceUrl: String, method: HTTPMethod, params: Parameters?, model: T.Type, serviceResponce: @escaping (T?, String, Bool) -> ()) where T : Decodable {
        
        if !(Servers.isConnectedToInternet()){
            serviceResponce(nil, "No Internet", false)
            return
        }
        
        sessionManager.request(serviceUrl, method: method, parameters: params, encoding: JSONEncoding.default, headers: getAuthorizationHeader())
            .validate(statusCode: 200..<209)
//            .responseJSON { (response) in
            .responseDecodable (of: model.self, decoder: JSONDecoder()) { (response) in
                
            switch response.result {
                
            case .success(_):
                self.showAPIRequestDetail(responseObject: response, symbol: APIString.Success.rawValue)
                
                if response.response?.statusCode == 201 || response.response?.statusCode == 200 {
                    do {
                        let jsonDecoder = try JSONDecoder().decode(model , from: response.data!)
                        serviceResponce(jsonDecoder, "", true)
                        
                    } catch {
                        printData("⛔️⛔️⛔️⛔️⛔️   \(error)   ⛔️⛔️⛔️⛔️⛔️")
                        serviceResponce(nil, error.localizedDescription, false)
                    }
                } else {
                    serviceResponce(nil, String(data: response.data ?? Data(), encoding: String.Encoding.utf8) ?? "Please Try Again", false)
                }
                
            case .failure(let error):
                self.showAPIRequestDetail(responseObject: response, symbol: APIString.Failure.rawValue)
                serviceResponce(nil, error.localizedDescription, false)
                
            }
        }
        
    }
    
    
    //MARK: - Print Methods
    func showAPIRequestDetail<T>(responseObject response : DataResponse<T, AFError>, symbol: String) {
        printData("\n\n\n\(symbol) ------- Response Start ------- \(symbol)")
        printData("\n==========     Response Time     ==========")
        printData(response.serializationDuration)
        
        printData("\n==========     URl     ==========")
        printData(response.request?.url?.absoluteString ?? "-----")
        
        printData("\n==========     HTTPHeaderFields     ==========")
        printData(response.request?.allHTTPHeaderFields?.description ?? "-----")
        
        printData("\n==========     Request Type     ==========")
        printData(response.request?.httpMethod?.description ?? "-----")
        
        printData("\n==========     Status Code     ==========")
        printData(response.response?.statusCode ?? "-----")
        
        printData("\n==========     Response Headers Type     ==========")
        printData(response.response?.allHeaderFields.description ?? "-----")
        
        if let bodyData : Data = response.request?.httpBody {
            let bodyString = String(data: bodyData, encoding: String.Encoding.utf8)
            printData("\n==========     Request HTTPBody     ==========\n" + (bodyString ?? "-----"))
        } else {
            printData("\n==========     Request HTTPBody     ==========\n" + "Found Request Body Nil")
        }
        
        if let responseData : Data = response.data {
            let responseString = String(data: responseData, encoding: String.Encoding.utf8)
            printData("\n==========     Response Data     ==========\n" + (responseString ?? ""))
        } else {
            printData("\n==========     Response Data     ==========\n" + "Found Response Body Nil")
        }
        
        printData("\n \(symbol) ------- Response End ------- \(symbol) \n\n\n")
        
        
    }
}
