//
//  CustomBackground.swift
//  POC
//
//  Created by CaioFranco on 13/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol CustomBackgroundViewDelegate: class {
    
}

class CustomBackgroundView: CustomView<CustomBackgroundView.Model?> {
    private var path: UIBezierPath!

    struct Model: CustomViewModel {
        let backgroundColorTriangle: UIColor
        let backgroundColorRectangle: UIColor
        
        init(
            backgroundColorTriangle: UIColor = Colors.blue,
            backgroundColorRectangle: UIColor = Colors.red
            )
        {
            self.backgroundColorTriangle = backgroundColorTriangle
            self.backgroundColorRectangle = backgroundColorRectangle
        }
    }
    
    weak var delegate: CustomBackgroundViewDelegate?
    
    override func addSubViews() {
        super.addSubViews()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        backgroundColor = Colors.white	
    }
    
            override func draw(_ rect: CGRect) {
                self.createTriangle()
                self.createRectangle()
            }
        
        func createRectangle() {
            // Initialize the path.
            path = UIBezierPath()
            let curvedPointB = CGPoint(x: self.frame.size.width/100*19, y: self.frame.height/100*65)
            
            path.move(to: CGPoint(x: 0.0, y: 0.0))
            path.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
            path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height/100*45))
            path.addLine(to: CGPoint(x: self.frame.size.width/2, y: self.frame.height/100*65))
            path.addQuadCurve(to: curvedPointB, controlPoint: CGPoint(x: self.frame.size.width/100*35, y: self.frame.size.height/100*71))
            path.addLine(to: CGPoint(x: 0, y: self.frame.height/100*55))
            path.close()
            
            // Specify the fill color and apply it to the path.
            model?.backgroundColorRectangle.setFill()
            path.fill()
        }
        
        func createTriangle() {
            // Initialize the path.
            path = UIBezierPath()
            
            path.move(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height/100*40))
            path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.height/100*68))
            path.addLine(to: CGPoint(x: self.frame.size.width/100*55, y: self.frame.height/100*60))
            path.close()
            
            // Specify the fill color and apply it to the path.
            model?.backgroundColorTriangle.setFill()
            path.fill()
        }
        
    
}
