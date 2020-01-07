//
//  AppCoordinator.swift
//  POC
//
//  Created by Bruno Vieira on 23/12/19.
//  Copyright © 2019 Bruno Vieira. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [String : Coordinator] = [String : Coordinator]()
    weak var parentCoordinator: Coordinator?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController, parentCoordinator: self)
        addChildCoordinator(loginCoordinator)
        loginCoordinator.start()
    }
    
}
