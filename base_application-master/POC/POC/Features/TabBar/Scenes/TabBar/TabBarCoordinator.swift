//
//  TabBarCoordinator.swift
//  POC
//
//  Created by Bruno Vieira on 02/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class TabBarCoordinator: Coordinator {
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
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController, parentCoordinator: self)
        let homeTabBarItem = UITabBarItem(title: TabBarViewModel.TabIndex.home.title(), image: nil, selectedImage: nil)
        homeNavigationController.tabBarItem = homeTabBarItem
        let aNavigationController = UINavigationController()
        let aCoordinator = FirstCoordinator(navigationController: aNavigationController, parentCoordinator: self)
        let aTabBarItem = UITabBarItem(title: TabBarViewModel.TabIndex.featureA.title(), image: nil, selectedImage: nil)
        aNavigationController.tabBarItem = aTabBarItem
        let bNavigationController = UINavigationController()
        let bCoordinator = ThirdCoordinator(navigationController: bNavigationController, parentCoordinator: self)
        let bTabBarItem = UITabBarItem(title: TabBarViewModel.TabIndex.featureB.title(), image: nil, selectedImage: nil)
        bNavigationController.tabBarItem = bTabBarItem
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(aCoordinator)
        addChildCoordinator(bCoordinator)
        let viewModel = TabBarViewModel(coordinator: self,
                                        tabBarControllers: [homeNavigationController,
                                                            aNavigationController,
                                                            bNavigationController])
        let viewController = TabBarViewController(with: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
    
    
    
}
