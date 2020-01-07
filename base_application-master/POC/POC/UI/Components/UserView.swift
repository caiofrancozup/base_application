//
//  UserView.swift
//  POC
//
//  Created by Bruno Vieira on 05/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
    
}

class UserView: CustomView<UserView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    weak var delegate: UserViewDelegate?
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.get(.placeholder)
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "HELLO"
        return label
    }()
    
    private lazy var notificationsButton: UIButton = {
        let button = UIButton()
        button.setTitle("N", for: .normal)
        button.setTitleColor(Colors.black, for: .normal)
        return button
    }()
    
    private lazy var lineView: LineView = {
        let view = LineView(model: LineView.Model(lineType: .continuous,
                                                  color: Colors.lightGray))
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [avatarImageView,
                                                       titleLabel,
                                                       notificationsButton])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = Margins.default
        return stackView
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(stackView)
        addSubview(lineView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.anchorToSuperview(topConstant: Margins.short,
                                    leftConstant: Margins.default,
                                    bottomConstant: Margins.short,
                                    rightConstant: Margins.default)
        
        avatarImageView.anchorSize(height: 25.0, width: 25.0)
        notificationsButton.anchorSize(height: 25.0, width: 25.0)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.anchorSize(height: 1.0)
        lineView.anchorMargins(left: left,
                               bottom: bottom,
                               right: right,
                               leftConstant: Margins.default,
                               bottomConstant: Margins.zero,
                               rightConstant: Margins.default)
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = .white
    }
    
}
