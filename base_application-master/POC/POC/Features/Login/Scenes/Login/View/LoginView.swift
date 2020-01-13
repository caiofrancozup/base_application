//
//  LoginView.swift
//  POC
//
//  Created by Bruno Vieira on 05/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit


class LoginView: CustomView<LoginView.Model?> {

    
    struct Model: CustomViewModel {
        
    }
   
    override func addSubViews() {
        super.addSubViews()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
       
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.lightGray
    }
    

}

