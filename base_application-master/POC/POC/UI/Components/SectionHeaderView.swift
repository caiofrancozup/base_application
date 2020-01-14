//
//  SectionHeaderView.swift
//  POC
//
//  Created by Bruno Vieira on 06/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class SectionHeaderView: CustomView<SectionHeaderView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "HEADER"
        label.textColor = .black
        return label
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(titleLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.anchorToSuperview(topConstant: Margins.default,
                                     leftConstant: Margins.large,
                                     bottomConstant: Margins.default,
                                     rightConstant: Margins.default)
    }
    
}
