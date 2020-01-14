//
//  FourthCoordinator.swift
//  POC
//
//  Created by Bruno Vieira on 07/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class FourthCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var childCoordinators: [String : Coordinator]
    
    var parentCoordinator: Coordinator?
    
    init(
        navigationController: UINavigationController,
        parentCoordinator: Coordinator? = nil
    ) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.childCoordinators = [String : Coordinator]()
    }
    
    func start() {
        let viewModel = FourthViewModel(coordinator: self)
        let viewController = FourthViewController(with: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
