//
//  ListViewModel.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 06/02/2022.
//

import Foundation
import SDWebImage


class ListViewModel: BaseViewModel {
    
    //MARK: - Variables
    var selectedBreedName = ""
    var breedImagesData: [String]?
    let service: BreedProtocol!
    var breedListSuccues = Observable(false)
    
    
    //MARK: - Init Methods
    init(selectedBreedName: String = "", service: BreedProtocol = BreedService()) {
        self.selectedBreedName = selectedBreedName
        self.service = service
    }
    
    
    //MARK: - Helper Methods
    
    
    //MARK: - Service
    func getBreedImages() {
        let uri = "/breed/\(selectedBreedName)/images"
        service.getBreedImageData(uri: uri) { response in
            self.breedImagesData = response
            self.breedListSuccues.value = true
            
        } failure: { message in
            self.errorMessage.value = message ?? ""
        }
    }
}
