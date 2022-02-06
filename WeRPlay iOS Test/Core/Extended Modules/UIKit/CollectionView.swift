//
//  CollectionView.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 06/02/2022.
//

import UIKit

//MARK: - UICollectionView
class CollectionView: UICollectionView {
    
    //MARK: - Init Methods
    required init(layout: UICollectionViewFlowLayout) {
        super.init(frame: .zero, collectionViewLayout: layout)
        super.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        contentInsetAdjustmentBehavior = .never
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - UICollectionViewCell
class CollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .clear
        setViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewUI() {
    }
}
