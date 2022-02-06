//
//  DataType Extentions.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 05/02/2022.
//

import UIKit

extension Int {
    var autoSized : CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let diagonalSize = sqrt((screenWidth * screenWidth) + (screenHeight * screenHeight))
        let percentage = CGFloat(self)/929*100 //894 is the diagonal size of iphone xs / 11pro
        return diagonalSize * percentage / 100
    }
}


//MARK: - CGFloat
extension CGFloat {
    var autoSized : CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let diagonalSize = sqrt((screenWidth * screenWidth) + (screenHeight * screenHeight))
        let percentage = CGFloat(self)/929*100 //894 is the diagonal size of iphone xs / 11pro
        return diagonalSize * percentage / 100
    }
}


//MARK: -  String
extension String {
    func createURL() -> URL? {
        let urlString  = self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        if let url = URL(string: urlString){
            return url
        }
        return  URL(string: "")
    }
}
