//
//  RoundShadowView.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class RoundShadowView: CustomView<RoundShadowView.Model> {

    struct Model: CustomViewModel {
        let subview: UIView
        let cornerRadius: CGFloat
        let margin: CGFloat
        
        public init(
            subview: UIView,
            cornerRadius: CGFloat = 20.0,
            margin: CGFloat = 20.0
        ) {
            self.subview = subview
            self.cornerRadius = cornerRadius
            self.margin = margin
        }
    }

    private lazy var roundedView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20.0
        return view
    }()
    
    override public func addSubViews() {
        super.addSubViews()
        addSubview(roundedView)
    }
    
    override public func setupConstraints() {
        super.setupConstraints()
        addConstraints([
            roundedView.topAnchor.constraint(equalTo: topAnchor),
            roundedView.leftAnchor.constraint(equalTo: leftAnchor),
            roundedView.bottomAnchor.constraint(equalTo: bottomAnchor),
            roundedView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
//        roundedView.anchorToSafeArea(topConstant: model.margin,
//                                     leftConstant: model.margin,
//                                     bottomConstant: model.margin,
//                                     rightConstant: model.margin)
    }
    
    override public func didUpdateModel() {
        super.didUpdateModel()
        
        backgroundColor = .clear
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = model.cornerRadius
        layer.shadowOpacity = 0.5

        configureSubview(model.subview)
        roundedView.layer.cornerRadius = model.cornerRadius
    }
    
    private func configureSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        roundedView.addSubview(view)
        
        roundedView.addConstraints([
            view.topAnchor.constraint(equalTo: roundedView.topAnchor),
            view.leftAnchor.constraint(equalTo: roundedView.leftAnchor),
            view.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor),
            view.rightAnchor.constraint(equalTo: roundedView.rightAnchor)
        ])
//        view.anchorToSafeArea()
    }
}