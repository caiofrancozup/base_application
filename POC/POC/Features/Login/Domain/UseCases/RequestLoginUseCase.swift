//
//  RequestLoginUseCase.swift
//  POC
//
//  Created by Bruno Vieira on 02/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import Foundation

protocol RequestLoginUseCaseProtocol {
    func execute()
}

class RequestLoginUseCase: RequestLoginUseCaseProtocol {
    
    private let service: LoginServiceProtocol
    
    init(
        service: LoginServiceProtocol = LoginService()
    ) {
        self.service = service
    }
    
    func execute() {
        service.requestLogin()
    }
    
}
