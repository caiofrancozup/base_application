//
//  UITabBar+Extensions.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

public extension UITabBar {
    
    func updateAppearance() {
        if #available(iOS 11, *) {
            barTintColor = Colors.blue
            tintColor = Colors.white
            unselectedItemTintColor = Colors.lightBlue
            layer.masksToBounds = true
            layer.cornerRadius = 20
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        guard let window = UIApplication.shared.keyWindow else {
            return super.sizeThatFits(size)
        }
        var sizeThatFits = super.sizeThatFits(size)
        if #available(iOS 11.0, *) {
            sizeThatFits.height = window.safeAreaInsets.bottom + 60
        } else {
            // Fallback on earlier versions
        }
        return sizeThatFits
    }
}
