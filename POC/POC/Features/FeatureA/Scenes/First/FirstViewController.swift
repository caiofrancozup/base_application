//
//  FirstViewController.swift
//  POC
//
//  Created by Bruno Vieira on 23/12/19.
//  Copyright © 2019 Bruno Vieira. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    private var viewModel: FirstViewModel?

    init(
        with viewModel: FirstViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: "FirstView", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "First"
        // Do any additional setup after loading the view.
    }


}

