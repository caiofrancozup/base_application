//
//  FourthViewController.swift
//  POC
//
//  Created by Bruno Vieira on 07/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

final class FourthViewController: UIViewController {
    
    private lazy var fourthView: FourthView = {
        let view = FourthView(model: nil)
        return view
    }()
    
    private let viewModel: FourthViewModel
    
    init(
        with viewModel: FourthViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        view = fourthView
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
