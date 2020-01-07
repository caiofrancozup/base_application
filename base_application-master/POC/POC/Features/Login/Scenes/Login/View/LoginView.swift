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
    
    private lazy var cpfTextField: UITextField = {
       let txtField = UITextField()
        txtField.placeholder = "xxx.xxx.xxx-xx"
        txtField.keyboardType = .numberPad
        txtField.borderStyle = .line
        return txtField
    }()
    
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
        addSubview(cpfTextField)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        translatesAutoresizingMaskIntoConstraints = true
        
        cpfTextField.translatesAutoresizingMaskIntoConstraints = false
        cpfTextField.anchorCenterToSuperview()
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.anchorCenterXToSuperview()
        loginButton.anchorMargins(top: cpfTextField.bottom, topConstant: Margins.default)
    }
    
  
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.lightGray
    }
    
    @objc private func loginButtonTapped() {
        delegate?.loginButtonTapped()
    }
    
}

