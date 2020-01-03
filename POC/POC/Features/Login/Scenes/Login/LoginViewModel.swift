//
//  LoginViewModel.swift
//  POC
//
//  Created by Bruno Vieira on 02/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import Foundation

final class LoginViewModel {
    
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

// MARK: Binding
extension LoginViewModel {
    
}

// MARK: Display Logic
extension LoginViewModel {
    func onViewDidLoad() {
        
    }
}

// MARK: Business Logic
extension LoginViewModel {
    func login() {
        requestLoginUseCase.execute()
        coordinator.enterApp()
    }
}


