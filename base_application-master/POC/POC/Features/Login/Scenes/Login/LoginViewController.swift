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
        ObserveKeyboard()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    // Control the screen height when keyboard appears
    func ObserveKeyboard() {
        TapToDismissKeyboard()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    // Configure Tap to Dismiss Keyboard
    func TapToDismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        self.view.addGestureRecognizer(tap)
    }
    
    // Dismiss keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Capture the size of the keyboard and pulls up the screen
    @objc func keyboardWillShow(_ notification: Notification) {
        if  let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.view.frame.origin.y = -keyboardHeight/4        }
    }
    
    // Return the screen back to place when keyboard is dismissed
    @objc func keyboardWillHide(_ notification: Notification) {
        self.view.frame.origin.y = 0
    }
    
}

extension LoginViewController: LoginViewDelegate {
    
    func loginButtonTapped() {
        viewModel.login()
    }
    
}
