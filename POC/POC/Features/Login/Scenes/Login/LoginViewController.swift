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
    private lazy var loginView: LoginView = {
        let view = LoginView(model: nil)
        view.delegate = self
        return view
    }()
    
    init(
        with viewModel: LoginViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension LoginViewController: LoginViewDelegate {
    
    func loginButtonTapped() {
        viewModel.login()
    }
    
}
