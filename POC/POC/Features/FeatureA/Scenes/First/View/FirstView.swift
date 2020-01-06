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
    
    private lazy var bannerCardView: RoundShadowView = {
        let view = RoundShadowView(model: RoundShadowView.Model(subview: bannerView))
        return view
    }()
    
    private lazy var bannerView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(bannerCardView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        translatesAutoresizingMaskIntoConstraints = true
        
        bannerCardView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerCardView.anchorMargins(top: top,
                                     left: left,
                                     right: right,
                                     topConstant: 0,
                                     leftConstant: 0,
                                     rightConstant: 0)
        bannerCardView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.lightBlue
    }
    
}
