//
//  FirstView.swift
//  POC
//
//  Created by Bruno Vieira on 05/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol FirstViewDelegate: class {
    
}

class FirstView: CustomView<FirstView.Model?> {
    
    weak var delegate: FirstViewDelegate?
    
    struct Model: CustomViewModel {
        
    }
//
//    private lazy var progressBarView: ProgressBarView = {
//        let progressBar = ProgressBarView(model: ProgressBarView.Model(progress: 0.0))
//        return progressBar
//    }()
//
//    private lazy var progressValueLabel: UILabel = {
//        let label = UILabel()
//        label.text = "0.0"
//        return label
//    }()
//
//    private lazy var progressButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("NEW PROGRESS VALUE", for: .normal)
//        button.addTarget(self, action: #selector(progressButtonTapped), for: .touchUpInside)
//        return button
//    }()
//
//    private lazy var logoutButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("LOGOUT", for: .normal)
//        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
//        return button
//    }()
    
    override func addSubViews() {
        super.addSubViews()
//        addSubview(progressBarView)
//        addSubview(progressValueLabel)
//        addSubview(progressButton)
//        addSubview(logoutButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        translatesAutoresizingMaskIntoConstraints = true
        
//        progressBarView.anchorMargins(top: top,
//                                      left: left,
//                                      right: right,
//                                      topConstant: Margins.large,
//                                      leftConstant: Margins.default,
//                                      rightConstant: Margins.default)
//        progressBarView.anchorSize(height: Sizes.default)
//
//        progressValueLabel.anchorMargins(top: progressBarView.bottom,
//                                         left: left,
//                                         right: right,
//                                         topConstant: Margins.default,
//                                         leftConstant: Margins.default,
//                                         rightConstant: Margins.default)
//
//        progressButton.anchorCenterXToSuperview()
//        progressButton.anchorMargins(top: progressValueLabel.bottom,
//                                     topConstant: Margins.large)
//
//        logoutButton.anchorCenterXToSuperview()
//        logoutButton.anchorMargins(top: progressButton.bottom,
//                                   topConstant: Margins.large)
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.lightBlue
        guard let _ = model else { return }
//        progressBarView.model = ProgressBarView.Model(progress: model.progress)
//        progressValueLabel.text = model.progressValueText
    }
    
//    @objc private func logoutButtonTapped() {
//        delegate?.logoutButtonTapped()
//    }
//
//    @objc private func progressButtonTapped() {
//        delegate?.progressButtonTapped()
//    }
    
}
