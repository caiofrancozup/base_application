//
//  LoginCoordinator.swift
//  POC
//
//  Created by Bruno Vieira on 02/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol LoginCoordinatorProtocol {
    func enterApp()
}

class LoginCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var childCoordinators: [String : Coordinator]
    
    weak var parentCoordinator: Coordinator?
    
    init(
        navigationController: UINavigationController,
        parentCoordinator: Coordinator? = nil
    ) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.childCoordinators = [String : Coordinator]()
    }
    
    func start() {
        let viewModel = LoginViewModel(coordinator: self, requestLoginUseCase: RequestLoginUseCase())
        let viewController = LoginViewController(with: viewModel)
        navigationController.setViewControllers([viewController], animated: true)
    }
    
}

extension LoginCoordinator: LoginCoordinatorProtocol {
    
    func enterApp() {
        let coordinator = TabBarCoordinator(navigationController: navigationController, parentCoordinator: self)
        coordinator.start()
    }
    
}
