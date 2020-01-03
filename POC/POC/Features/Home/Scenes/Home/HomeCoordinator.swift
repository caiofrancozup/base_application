//
//  HomeCoordinator.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
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
        let viewModel = HomeViewModel(coordinator: self)
        let viewController = HomeViewController(with: viewModel)
        navigationController.setViewControllers([viewController], animated: true)
    }
}
