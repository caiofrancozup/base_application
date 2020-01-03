//
//  ThirdView.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import Foundation

class ThirdView: CustomView<ThirdView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = .orange
    }
    
    override func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = true
    }
    
}
