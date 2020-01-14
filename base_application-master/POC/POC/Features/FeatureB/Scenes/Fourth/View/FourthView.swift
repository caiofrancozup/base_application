//
//  FourthView.swift
//  POC
//
//  Created by Bruno Vieira on 07/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class FourthView: CustomView<FourthView.Model?> {
    
    struct Model: CustomViewModel {
        
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "asfhasjf a f"
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.get(.placeholder))
        return imageView
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(label)
        addSubview(imageView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        translatesAutoresizingMaskIntoConstraints = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.anchorCenterToSuperview()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.anchorSize(height: 100.0, width: 100.0)
        imageView.anchorCenterXToSuperview()
        imageView.anchorMargins(top: label.bottom,
                                topConstant: 50.0)
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = .yellow
    }
    
}
