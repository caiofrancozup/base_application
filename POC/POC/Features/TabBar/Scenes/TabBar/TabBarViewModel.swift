//
//  TabBarViewModel.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

final class TabBarViewModel {

    enum TabIndex: Int {
        case home
        case featureA
        case featureB
        
        func title() -> String {
            switch self {
            case .home:
                return "Home"
            case .featureA:
                return "AAA"
            case .featureB:
                return "BBB"
            }
        }
    }
    
    private weak var coordinator: Coordinator?
    private(set) var selectedTab: TabIndex = .home
    private(set) var tabBarControllers: [UIViewController]
    
    init(
        coordinator: Coordinator,
        tabBarControllers: [UIViewController]
    ) {
        self.coordinator = coordinator
        self.tabBarControllers = tabBarControllers
    }
    
    func selectTab(_ tabIndex: TabIndex) {
        
    }
    
}
