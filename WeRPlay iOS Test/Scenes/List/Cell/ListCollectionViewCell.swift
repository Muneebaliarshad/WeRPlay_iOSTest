//
//  ListCollectionViewCell.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 06/02/2022.
//

import UIKit

class ListCollectionViewCell: CollectionViewCell {
    
    //MARK: - UIElements
    let dataImageView = ImageView(imageName: "Logo", cornerRadius: 20)
    
    
    //MARK: - Nib Methods
    override func setViewUI() {
        addElementsToView()
        dataImageView.contentMode = .scaleAspectFill
    }
    
    fileprivate func addElementsToView() {
        addSubview(dataImageView)
        
        NSLayoutConstraint.activate([
            
            ///dataImageView
            dataImageView.topAnchor.constraint(equalTo: topAnchor),
            dataImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dataImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dataImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        shadow(color: .gray)
    }
}
