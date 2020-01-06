//
//  CardView.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

public class CardView: CustomView<CardView.Model> {

    public struct Model: CustomViewModel {
        
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Message"
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "Value"
        return label
    }()
    
    private lazy var cardTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "CardType"
        return label
    }()
    
    private lazy var cardNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "CardNumber"
        return label
    }()
    
    override public func addSubViews() {
        super.addSubViews()
    }
    
    override public func setupConstraints() {
        super.setupConstraints()
    }
    
    override public func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = .yellow
    }
}
