//
//  UIView+Extensions.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

// MARK: Constraints helper
extension UIView {
    
    var top: NSLayoutYAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.topAnchor
        } else {
            return layoutMarginsGuide.topAnchor
        }
    }
    
    
    var bottom: NSLayoutYAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.bottomAnchor
        } else {
            return layoutMarginsGuide.bottomAnchor
        }
    }
    
    
    var left: NSLayoutXAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.leftAnchor
        } else {
            return layoutMarginsGuide.leftAnchor
        }
    }
    
    
    var right: NSLayoutXAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.rightAnchor
        } else {
            return layoutMarginsGuide.rightAnchor
        }
    }
    
    public func layoutGuide() -> UILayoutGuide {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide
        } else {
            return layoutMarginsGuide
        }
    }
    
    public func anchorToSafeArea(topConstant: CGFloat = 0,
                                 leftConstant: CGFloat = 0,
                                 bottomConstant: CGFloat = 0,
                                 rightConstant: CGFloat = 0) {
        if let superview = superview {
            let layoutGuide = superview.layoutGuide()
            let top = topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: topConstant)
            let left = leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: leftConstant)
            let bottom = bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -bottomConstant)
            let right = rightAnchor.constraint(equalTo: layoutGuide.rightAnchor, constant: -rightConstant)
            NSLayoutConstraint.activate([left, right, top, bottom])
        }
    }
    
    public func anchorToSuperview(topConstant: CGFloat = 0,
                                  leftConstant: CGFloat = 0,
                                  bottomConstant: CGFloat = 0,
                                  rightConstant: CGFloat = 0) {
        if let superview = superview {
            let top = topAnchor.constraint(equalTo: superview.topAnchor, constant: topConstant)
            let left = leftAnchor.constraint(equalTo: superview.leftAnchor, constant: leftConstant)
            let bottom = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bottomConstant)
            let right = rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -rightConstant)
            NSLayoutConstraint.activate([left, right, top, bottom])
        }
    }
    
    public func anchorMargins(
        top: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        topConstant: CGFloat = 0,
        leftConstant: CGFloat = 0,
        bottomConstant: CGFloat = 0,
        rightConstant: CGFloat = 0) {
        var constraints = [NSLayoutConstraint]()
        if let top = top {
            constraints.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        if let left = left {
            constraints.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        if let bottom = bottom {
            constraints.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        if let right = right {
            constraints.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        NSLayoutConstraint.activate(constraints)
    }
    
    public func anchorSize(height: CGFloat = 0, width: CGFloat = 0) {
        var constraints = [NSLayoutConstraint]()
        if width > 0 {
            constraints.append(widthAnchor.constraint(equalToConstant: width))
        }
        if height > 0 {
            constraints.append(heightAnchor.constraint(equalToConstant: height))
        }
        NSLayoutConstraint.activate(constraints)
    }
    
    public func anchorCenterXToSuperview(constant: CGFloat = 0) {
        if let anchor = superview?.layoutGuide().centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    public func anchorCenterYToSuperview(constant: CGFloat = 0) {
        if let anchor = superview?.layoutGuide().centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    public func anchorCenterToSuperview() {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
    }
    
}

extension UIView {
    
    
    
}

