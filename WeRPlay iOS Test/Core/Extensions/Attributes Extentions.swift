//
//  Attributes Extentions.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 05/02/2022.
//

import UIKit

extension UIFont {
    
    public enum FontStyle: String {
        case Regular = "-Regular"
        case Medium = "-Medium"
        case SemiBold = "-SemiBold"
        case Bold = "-Bold"
    }
    
    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }
    
    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
    
    
    static func Poppins(_ type: FontStyle = .Regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Poppins\(type.rawValue)", size: size)!
    }
}


//MARK: - UIColor
extension UIColor {
    class var themeColor: UIColor {
        return UIColor(named: "AccentColor")!
    }
    
    class var backgroundColor: UIColor {
        return UIColor(named: "ViewBGColor")!
    }
}

