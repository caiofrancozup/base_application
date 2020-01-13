//
//  TabBarViewController.swift
//  POC
//
//  Created by Bruno Vieira on 02/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    private let viewModel: TabBarViewModel
    
    init(
        with viewModel: TabBarViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tabBar.updateAppearance()
    }
    
    private func setup() {
        setViewControllers(viewModel.tabBarControllers, animated: false)
        selectedIndex = viewModel.selectedTab.rawValue
    }
    
}
