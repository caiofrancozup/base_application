//
//  ThirdViewController.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

final class ThirdViewController: UIViewController {
    
    private let viewModel: ThirdViewModel
    private lazy var thirdView: ThirdView = {
        let view = ThirdView(model: nil)
        return view
    }()
    
    init(
        with viewModel: ThirdViewModel
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
        view = thirdView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
