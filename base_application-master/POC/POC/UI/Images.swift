//
//  Images.swift
//  POC
//
//  Created by Bruno Vieira on 29/12/19.
//  Copyright © 2019 Bruno Vieira. All rights reserved.
//

import UIKit

enum Images: String, CaseIterable {
    
    case arrow
    case image
    case placeholder
    
}

extension UIImage {
    
    static func get(_ image: Images) -> UIImage {
        let loadedImage = UIImage(named: image.rawValue) ?? UIImage(named: Images.placeholder.rawValue)
        return loadedImage!
    }
    
}
