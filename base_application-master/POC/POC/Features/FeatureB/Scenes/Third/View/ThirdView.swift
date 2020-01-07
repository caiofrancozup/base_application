//
//  ThirdView.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol ThirdViewDelegate: class {
    func logoutButtonTapped()
    func progressButtonTapped()
}

class ThirdView: CustomView<ThirdView.Model?> {
    
    weak var delegate: ThirdViewDelegate?
    
    struct Model: CustomViewModel {
        let progress: CGFloat
        let progressValueText: String
    }
    
    private lazy var progressBarView: ProgressBarView = {
        let progressBar = ProgressBarView(model: ProgressBarView.Model(progress: 0.0))
        return progressBar
    }()
    
    private lazy var progressValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0"
        return label
    }()
    
    private lazy var progressButton: UIButton = {
        let button = UIButton()
        button.setTitle("NEW PROGRESS VALUE", for: .normal)
        button.addTarget(self, action: #selector(progressButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGOUT", for: .normal)
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(progressBarView)
        addSubview(progressValueLabel)
        addSubview(progressButton)
        addSubview(logoutButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        translatesAutoresizingMaskIntoConstraints = true
        
        progressBarView.translatesAutoresizingMaskIntoConstraints = false
        progressBarView.anchorMargins(top: top,
                                      left: left,
                                      right: right,
                                      topConstant: Margins.large,
                                      leftConstant: Margins.default,
                                      rightConstant: Margins.default)
        progressBarView.anchorSize(height: Sizes.default)
        
        progressValueLabel.translatesAutoresizingMaskIntoConstraints = false
        progressValueLabel.anchorMargins(top: progressBarView.bottom,
                                         left: left,
                                         right: right,
                                         topConstant: Margins.default,
                                         leftConstant: Margins.default,
                                         rightConstant: Margins.default)
        
        progressButton.translatesAutoresizingMaskIntoConstraints = false
        progressButton.anchorCenterXToSuperview()
        progressButton.anchorMargins(top: progressValueLabel.bottom,
                                     topConstant: Margins.large)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.anchorCenterXToSuperview()
        logoutButton.anchorMargins(top: progressButton.bottom,
                                   topConstant: Margins.large)
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.green
        guard let model = model else { return }
        progressBarView.model = ProgressBarView.Model(progress: model.progress)
        progressValueLabel.text = model.progressValueText
    }
    
    @objc private func logoutButtonTapped() {
        delegate?.logoutButtonTapped()
    }
    
    @objc private func progressButtonTapped() {
        delegate?.progressButtonTapped()
    }
    
}
