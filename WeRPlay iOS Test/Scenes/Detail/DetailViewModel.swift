//
//  DetailViewModel.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 06/02/2022.
//

import Foundation

class DetailViewModel: BaseViewModel {
    
    //MARK: - Variables
    var selectedBreedName = ""
    var selectedImage = ""
    
    
    //MARK: - Init Methods
    init(selectedBreedName: String = "", selectedImage: String = "") {
        self.selectedBreedName = selectedBreedName
        self.selectedImage = selectedImage
    }
    
    
    //MARK: - Helper Methods
    //MARK: - Service
}
