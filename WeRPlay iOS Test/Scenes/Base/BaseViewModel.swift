//
//  BaseViewModel.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 05/02/2022.
//

import Foundation


class Observable<T> {
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
}


class BaseViewModel {
    // MARK: - Properties
    var errorMessage = Observable("")
}
