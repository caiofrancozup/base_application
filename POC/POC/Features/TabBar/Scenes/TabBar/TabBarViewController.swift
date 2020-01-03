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
        super.init(nibName: "TabBarView", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        if #available(iOS 11, *) {
            tabBar.barTintColor = UIColor.red
            tabBar.layer.masksToBounds = true
            tabBar.layer.cornerRadius = 20
            tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    
    private func setup() {
        tabBarController?.tabBar.setItems(viewModel.tabBarItems, animated: false)
        setViewControllers(viewModel.tabBarControllers, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
