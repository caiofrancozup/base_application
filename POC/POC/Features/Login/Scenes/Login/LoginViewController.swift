//
//  LoginViewController.swift
//  POC
//
//  Created by Bruno Vieira on 02/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    
    private var viewModel: LoginViewModelProtocol!
    
    static func create(with viewModel: LoginViewModelProtocol) -> UIViewController {
        let viewController = LoginViewController.instantiate()
        viewController.viewModel = viewModel
        return viewController
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        viewModel.login()
    }
    
}
