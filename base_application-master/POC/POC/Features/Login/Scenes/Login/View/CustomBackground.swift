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
    private var pathRectangle: UIBezierPath!
    private var pathTriangle: UIBezierPath!
    
    struct Model: CustomViewModel {
        let backgroundGradientStartTriangle: UIColor
        let backgroundGradientFinishTriangle: UIColor
        let backgroundGradientStartRectangle: UIColor
        let backgroundGradientFinishRectangle: UIColor
        
        init(
            backgroundGradientStartTriangle: UIColor = Colors.blue,
            backgroundGradientFinishTriangle: UIColor = Colors.red,
            backgroundGradientStartRectangle: UIColor = Colors.blue,
            backgroundGradientFinishRectangle: UIColor = Colors.red
        )
        {
            self.backgroundGradientStartTriangle = backgroundGradientStartTriangle
            self.backgroundGradientFinishTriangle = backgroundGradientFinishTriangle
            self.backgroundGradientStartRectangle = backgroundGradientStartRectangle
            self.backgroundGradientFinishRectangle = backgroundGradientFinishRectangle
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
        pathRectangle = UIBezierPath()
        let curvedPointB = CGPoint(x: self.frame.size.width/100*19, y: self.frame.height/100*65)
        
        pathRectangle.move(to: CGPoint(x: 0.0, y: 0.0))
        pathRectangle.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
        pathRectangle.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height/100*45))
        pathRectangle.addLine(to: CGPoint(x: self.frame.size.width/2, y: self.frame.height/100*65))
        pathRectangle.addQuadCurve(to: curvedPointB, controlPoint: CGPoint(x: self.frame.size.width/100*35, y: self.frame.size.height/100*71))
        pathRectangle.addLine(to: CGPoint(x: 0, y: self.frame.height/100*55))
        pathRectangle.close()
        
        // Create the frame to format the gradient
        let rectangle = CAShapeLayer()
        rectangle.frame = layer.frame
        rectangle.path = pathRectangle.cgPath
        
        // create the gradient based in model colors
        let gradient = CAGradientLayer()
        gradient.frame = layer.frame
        gradient.colors = [
            model?.backgroundGradientStartRectangle.cgColor ?? Colors.red.cgColor,
            model?.backgroundGradientFinishRectangle.cgColor ?? Colors.black.cgColor
        ]
        
        // Add layer mask and sublayer to paint
        gradient.mask = rectangle
        layer.addSublayer(gradient)
    }
    
    func createTriangle() {
        // Initialize the path.
        pathTriangle = UIBezierPath()
        
        pathTriangle.move(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height/100*40))
        pathTriangle.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.height/100*68))
        pathTriangle.addLine(to: CGPoint(x: self.frame.size.width/100*55, y: self.frame.height/100*60))
        pathTriangle.close()
        
        // Create the frame to format the gradient
        let triangle = CAShapeLayer()
        triangle.frame = layer.frame
        triangle.path = pathTriangle.cgPath
        
        // create the gradient based in model colors
        let gradient = CAGradientLayer()
        gradient.frame = layer.frame
        gradient.colors = [
            model?.backgroundGradientStartTriangle.cgColor ?? Colors.red.cgColor,
            model?.backgroundGradientFinishTriangle.cgColor ?? Colors.black.cgColor
        ]
        
        // Add layer mask and sublayer to paint
        gradient.mask = triangle
        layer.addSublayer(gradient)
    }
    
    
}
