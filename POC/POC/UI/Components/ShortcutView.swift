//
//  ShortcutView.swift
//  POC
//
//  Created by Bruno Vieira on 06/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class ShortcutView: CustomView<ShortcutView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.get(.placeholder)
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "XXX"
        return label
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(iconImageView)
        addSubview(titleLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.anchorSize(height: 25.0, width: 25.0)
        iconImageView.anchorMargins(top: top,
                                    left: left,
                                    topConstant: Margins.default,
                                    leftConstant: Margins.default)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.anchorMargins(top: iconImageView.bottom,
                                 left: left,
                                 topConstant: Margins.short,
                                 leftConstant: Margins.default)
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.lightGray
    }
}
