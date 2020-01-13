//
//  AccountSummaryView.swift
//  POC
//
//  Created by Bruno Vieira on 06/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol AccountSummaryViewDelegate: class {
    
}

class AccountSummaryView: CustomView<AccountSummaryView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    weak var delegate: AccountSummaryViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Blablabla"
        label.textColor = Colors.white
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "tttt"
        label.textColor = Colors.white
        return label
    }()
    
    private lazy var detailsButton: UIButton = {
        let button = UIButton()
        button.setTitle("DETAILS", for: .normal)
        button.setTitleColor(Colors.lightBlue, for: .normal)
        return button
    }()
    
    private lazy var textContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.blue
        return view
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(contentView)
        contentView.addSubview(textContainerView)
        contentView.addSubview(detailsButton)
        textContainerView.addSubview(titleLabel)
        textContainerView.addSubview(valueLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.anchorToSuperview(topConstant: Margins.zero,
                                      leftConstant: Margins.zero,
                                      bottomConstant: Margins.zero,
                                      rightConstant: Margins.zero)
        
        textContainerView.translatesAutoresizingMaskIntoConstraints = false
        textContainerView.anchorMargins(top: contentView.top,
                                        left: contentView.left,
                                        bottom: contentView.bottom,
                                        topConstant: Margins.default,
                                        leftConstant: Margins.default,
                                        bottomConstant: Margins.default)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.anchorMargins(top: textContainerView.top,
                                 left: textContainerView.left,
                                 right: textContainerView.right,
                                 topConstant: Margins.zero,
                                 leftConstant: Margins.zero,
                                 rightConstant: Margins.zero)

        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.anchorMargins(top: titleLabel.bottom,
                                 left: textContainerView.left,
                                 bottom: textContainerView.bottom,
                                 right: textContainerView.right,
                                 topConstant: Margins.zero,
                                 leftConstant: Margins.zero,
                                 bottomConstant: Margins.zero,
                                 rightConstant: Margins.zero)
        
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([
            detailsButton.leftAnchor.constraint(equalTo: textContainerView.rightAnchor, constant: Margins.default),
            detailsButton.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: Margins.default),
            detailsButton.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -Margins.default),
            detailsButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Margins.default),
            detailsButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        titleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        valueLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        detailsButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textContainerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = .white
    }
    
}
