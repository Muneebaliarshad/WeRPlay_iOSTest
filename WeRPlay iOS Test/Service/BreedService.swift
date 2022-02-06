//
//  BreedService.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 06/02/2022.
//

import Foundation


protocol BreedProtocol {
    func getBreedData(success: @escaping ((_ response: [String: [String]]?) -> ()), failure: @escaping(_ message: String?) -> ())
    func getBreedImageData(uri: String, success: @escaping ((_ response: [String]?) -> ()), failure: @escaping(_ message: String?) -> ())
}

enum Breed {
    struct BreedListModel: Codable {
        var status: String?
        var message: [String: [String]]?
    }
    
    struct BreadName: Codable {
        let name: String?
        let types: [String]?
    }
    
    struct BreedImageListModel: Codable {
        var status: String?
        var message: [String]?
    }
}



class BreedService: BreedProtocol {
    func getBreedData(success: @escaping (([String: [String]]?) -> ()), failure: @escaping (String?) -> ()) {
        Spinner.shared.showLoader()
        
        Service.default.execute(serviceUrl: Servers.baseURLWith(route: Route.list.rawValue), method: .get, params: nil, model: Breed.BreedListModel.self) { responseData, message, status in
            
            Spinner.shared.removeLoader()
            if status == true {
                success(responseData?.message)
            }else {
                failure(message)
            }
        }
    }
    
    func getBreedImageData(uri: String, success: @escaping (([String]?) -> ()), failure: @escaping (String?) -> ()) {
        Spinner.shared.showLoader()
        
        Service.default.execute(serviceUrl: Servers.baseURLWith(route: uri), method: .get, params: nil, model: Breed.BreedImageListModel.self) { responseData, message, status in
            
            Spinner.shared.removeLoader()
            if status == true {
                success(responseData?.message)
            }else {
                failure(message)
            }
        }
    }
}

