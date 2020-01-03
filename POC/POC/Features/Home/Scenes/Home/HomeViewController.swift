//
//  HomeViewController.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let viewModel: HomeViewModel
    
    init(
        with viewModel: HomeViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: "HomeView", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
}
