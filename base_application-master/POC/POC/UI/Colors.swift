//
//  Colors.swift
//  POC
//
//  Created by Bruno Vieira on 28/12/19.
//  Copyright © 2019 Bruno Vieira. All rights reserved.
//

import UIKit

final class Colors {
    
    static let black = UIColor(from: "000000")
    static let white = UIColor(from: "FFFFFF")
    static let gray = UIColor(from: "C9C9C9")
    static let lightGray = UIColor(from: "F4F5F9")
    static let green = UIColor(from: "69CA66")
    static let orange = UIColor(from: "F8A14A")
    static let red = UIColor(from: "FD6B65")
    static let blue = UIColor(from: "0C1241")
    static let lightBlue = UIColor(from: "6392E9")
    
}

extension UIColor {
    
    /// Creates a UIColor for it's red, green, and blue values
    private convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    
    /// Creates a UIColor from a hexadecimal representation
    public convenience init(from hexValue: String) {
        // Remove # if existis
        let tempHex = hexValue.replacingOccurrences(of: "#", with: "")
        
        let hex = Int(tempHex, radix: 16)
        
        if hex != nil {
            self.init(red:(hex! >> 16) & 0xff, green:(hex! >> 8) & 0xff, blue:hex! & 0xff)
        } else {
            assert(hex == nil, "Invalid Hex value")
            self.init(red: 0, green: 0, blue: 0)
        }
    }
}
