//
//  FirstCoordinator.swift
//  POC
//
//  Created by Bruno Vieira on 02/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class FirstCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var childCoordinators: [String : Coordinator]
    
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.childCoordinators = [String : Coordinator]()
    }
    
    func start() {
        let viewController = FirstViewController.instantiate()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
