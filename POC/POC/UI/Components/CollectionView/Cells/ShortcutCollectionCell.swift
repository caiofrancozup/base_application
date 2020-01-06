//
//  ShortcutCollectionCell.swift
//  POC
//
//  Created by Bruno Vieira on 06/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class ShortcutCollectionCell: CollectionViewCell<ShortcutCollectionCell.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    private lazy var shortcutView: ShortcutView = {
        let view = ShortcutView(model: ShortcutView.Model())
        return view
    }()
    
    private lazy var roundView: RoundShadowView = {
        let view = RoundShadowView(model: RoundShadowView.Model(subview: shortcutView,
                                                                cornerRadius: 10.0,
                                                                margin: 0.0))
        return view
    }()
    
    override func addSubViews() {
        super.addSubViews()
        contentView.addSubview(roundView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        roundView.translatesAutoresizingMaskIntoConstraints = false
        roundView.anchorToSuperview()
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = .clear
    }
}
