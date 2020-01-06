//
//  LoginView.swift
//  POC
//
//  Created by Bruno Vieira on 05/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: class {
    func loginButtonTapped()
}

class LoginView: CustomView<LoginView.Model?> {
    
    weak var delegate: LoginViewDelegate?
    
    struct Model: CustomViewModel {
        
    }
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(Colors.black, for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(loginButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        translatesAutoresizingMaskIntoConstraints = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.anchorCenterToSuperview()
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.lightGray
    }
    
    @objc private func loginButtonTapped() {
        delegate?.loginButtonTapped()
    }
    
}

