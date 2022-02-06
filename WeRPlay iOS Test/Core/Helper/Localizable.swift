//
//  Localizable.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 05/02/2022.
//

import UIKit

//MARK: - Localizable
public protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
