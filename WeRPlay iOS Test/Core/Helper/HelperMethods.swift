//
//  HelperMethods.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 06/02/2022.
//

import Foundation
import UIKit

func printData(_ object: Any) {
#if DEBUG
    Swift.print(object)
#elseif RELEASE
    Swift.print(object)
#endif
}

func getScreenWidth() -> CGFloat {
    return UIScreen.main.bounds.width
}

func getScreenHeight() -> CGFloat {
    return UIScreen.main.bounds.height
}
