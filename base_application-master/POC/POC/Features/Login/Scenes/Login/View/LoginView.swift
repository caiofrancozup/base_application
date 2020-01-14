//
//  LoginView.swift
//  POC
//
//  Created by Bruno Vieira on 05/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: class {
    
}

class LoginView: CustomView<LoginView.Model?> {
    weak var delegate: LoginViewDelegate?
    struct Model: CustomViewModel {
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.get(.placeholder))
        return imageView
    }()
    
    private lazy var backgroundView: CustomBackgroundView = {
        let background = CustomBackgroundView(model: CustomBackgroundView.Model(backgroundColorTriangle: Colors.red, backgroundColorRectangle: Colors.orange))
        return background
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(backgroundView)
        addSubview(imageView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        translatesAutoresizingMaskIntoConstraints = true
        

        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.anchorToSuperview()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.anchorCenterToSuperview()
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.white
    }    
}

extension LoginViewController: LoginViewDelegate {
    
}

