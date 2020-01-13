//
//  Fonts.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

final class Fonts {

    public enum Style: String {
        case extraLight = "1"
        case extraLightItalic = "2"
        case light = "3"
        case lightItalic = "4"
        case book = "5"
        case bookItalic = "6"
        case medium = "7"
        case mediumItalic = "8"
        case bold = "9"
        case boldItalic = "10"
        case black = "11"
        case blackItalic = "12"
    }
    
    public static func of(size: CGFloat, style: Fonts.Style) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
