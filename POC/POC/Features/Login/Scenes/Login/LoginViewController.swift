//
//  LoginViewController.swift
//  POC
//
//  Created by Bruno Vieira on 02/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let viewModel: LoginViewModel
    
    init(
        with viewModel: LoginViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: "LoginView", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction private func loginTapped(_ sender: Any) {
        viewModel.login()
    }
    
}