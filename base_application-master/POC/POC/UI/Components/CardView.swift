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
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "blabla"
        label.textColor = Colors.white
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = Colors.white
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Message"
        label.textColor = Colors.white
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "Value"
        label.textColor = Colors.white
        return label
    }()
    
    private lazy var cardTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "CardType"
        label.textColor = Colors.white
        label.textAlignment = .right
        return label
    }()
    
    private lazy var cardNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "CardNumber"
        label.textColor = Colors.white
        label.textAlignment = .right
        return label
    }()
    
    private lazy var cardIconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.get(.placeholder))
        return imageView
    }()
    
    private lazy var cardDataContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var limitDataContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var progressBarView: ProgressBarView = {
        let view = ProgressBarView(model: ProgressBarView.Model(progress: CGFloat(Double.random(in: 0.0..<1.0))))
        return view
    }()
    
    override public func addSubViews() {
        super.addSubViews()
        
        addSubview(label)
        cardDataContainerView.addSubview(cardTypeLabel)
        cardDataContainerView.addSubview(cardNumberLabel)
        addSubview(cardDataContainerView)
        limitDataContainerView.addSubview(titleLabel)
        limitDataContainerView.addSubview(valueLabel)
        addSubview(limitDataContainerView)
        addSubview(cardIconImageView)
        addSubview(progressBarView)
    }
    
    override public func setupConstraints() {
        super.setupConstraints()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.anchorMargins(top: top,
                            left: left,
                            topConstant: Margins.default,
                            leftConstant: Margins.default)
        
        cardTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        cardTypeLabel.anchorMargins(top: cardDataContainerView.top,
                                    left: cardDataContainerView.left,
                                    right: cardDataContainerView.right)
        
        cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        cardNumberLabel.anchorMargins(top: cardTypeLabel.bottom,
                                      left: cardDataContainerView.left,
                                      bottom: cardDataContainerView.bottom,
                                      right: cardDataContainerView.right)
        
        cardDataContainerView.translatesAutoresizingMaskIntoConstraints = false
        cardDataContainerView.anchorMargins(top: top,
                                            left: label.right,
                                            right: right,
                                            topConstant: Margins.default,
                                            leftConstant: Margins.default,
                                            rightConstant: Margins.default)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.anchorMargins(top: limitDataContainerView.top,
                                 left: limitDataContainerView.left,
                                 right: limitDataContainerView.right)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.anchorMargins(top: titleLabel.bottom,
                                 left: limitDataContainerView.left,
                                 bottom: limitDataContainerView.bottom,
                                 right: limitDataContainerView.right)
        
        limitDataContainerView.translatesAutoresizingMaskIntoConstraints = false
        limitDataContainerView.anchorMargins(top: cardDataContainerView.bottom,
                                             left: left,
                                             topConstant: Margins.short,
                                             leftConstant: Margins.default)
        
        cardIconImageView.translatesAutoresizingMaskIntoConstraints = false
        cardIconImageView.anchorSize(height: 25.0, width: 25.0)
        cardIconImageView.anchorMargins(left: limitDataContainerView.right,
                                        right: right,
                                        leftConstant: Margins.default,
                                        rightConstant: Margins.default)
        cardIconImageView.centerYAnchor.constraint(equalTo: limitDataContainerView.centerYAnchor).isActive = true
        
        progressBarView.anchorSize(height: 10.0)
        progressBarView.anchorMargins(top: limitDataContainerView.bottom,
                                      left: left,
                                      bottom: bottom,
                                      right: right,
                                      topConstant: Margins.short,
                                      leftConstant: Margins.default,
                                      bottomConstant: Margins.default,
                                      rightConstant: Margins.default)
        
    }
    
    override public func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.green
    }
}
