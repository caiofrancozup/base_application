//
//  LoginViewModel.swift
//  POC
//
//  Created by Bruno Vieira on 02/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol: LoginViewModelDisplayLogic, LoginViewModelBusinessLogic {}

protocol LoginViewModelDisplayLogic {
    func onViewDidLoad()
}

protocol LoginViewModelBusinessLogic {
    func login()
}

protocol LoginViewModelBinding: AnyObject {
    
}

class LoginViewModel: LoginViewModelProtocol {
    
    private let coordinator: LoginCoordinatorProtocol
    private let requestLoginUseCase: RequestLoginUseCaseProtocol
    
    init(
        coordinator: LoginCoordinatorProtocol,
        requestLoginUseCase: RequestLoginUseCaseProtocol = RequestLoginUseCase()
    ) {
        self.coordinator = coordinator
        self.requestLoginUseCase = requestLoginUseCase
    }
    
}

extension LoginViewModel: LoginViewModelBinding {
    
}

extension LoginViewModel: LoginViewModelDisplayLogic {
    func onViewDidLoad() {
        
    }
}

extension LoginViewModel: LoginViewModelBusinessLogic {
    func login() {
        requestLoginUseCase.execute()
        coordinator.enterApp()
    }
}


