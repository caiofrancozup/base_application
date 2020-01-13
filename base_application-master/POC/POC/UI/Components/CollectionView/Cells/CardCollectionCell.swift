//
//  CardCollectionCell.swift
//  POC
//
//  Created by Bruno Vieira on 06/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class CardCollectionCell: CollectionViewCell<CardCollectionCell.Model> {
    
    struct Model: CustomViewModel {
        
    }
    
    private lazy var cardView: CardView = {
        let view = CardView(model: CardView.Model())
        return view
    }()
    
    private lazy var roundView: RoundShadowView = {
        let view = RoundShadowView(model: RoundShadowView.Model(subview: cardView, margin: 0.0))
        return view
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(roundView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        roundView.translatesAutoresizingMaskIntoConstraints = false
        roundView.anchorToSuperview()
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = .yellow
    }
    
}

