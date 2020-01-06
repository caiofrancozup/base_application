//
//  FirstViewController.swift
//  POC
//
//  Created by Bruno Vieira on 23/12/19.
//  Copyright © 2019 Bruno Vieira. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let viewModel: FirstViewModel?
    private lazy var firstView: FirstView = {
        let view = FirstView(model: nil)
        view.delegate = self
        return view
    }()

    init(
        with viewModel: FirstViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = firstView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "First"
        navigationController?.setNavigationBarHidden(true, animated: false)
    }


}

extension FirstViewController: FirstViewDelegate {
    
}

