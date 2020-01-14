//
//  ThirdCoordinator.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class ThirdCoordinator: Coordinator {
    
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
        let viewModel = ThirdViewModel(coordinator: self)
        let viewController = ThirdViewController(with: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func finish() {
        parentCoordinator?.finish()
    }
    
    func next() {
        let coordinator = FourthCoordinator(navigationController: navigationController,
                                            parentCoordinator: self)
        coordinator.start()
    }
    
    
}
