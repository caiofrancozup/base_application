//
//  BezierCornerEffect.swift
//  POC
//
//  Created by CaioFranco on 14/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol BezierCornerEffectViewDelegate: class {
    
}

class BezierCornerEffectView: CustomView<BezierCornerEffectView.Model?> {
    private var path: UIBezierPath!
    
    struct Model: CustomViewModel {
        let topLineGradientStartColor: UIColor
        let topLineGradientFinishColor: UIColor
        let bottomLineGradientStartColor: UIColor
        let bottomLineGradientFinishColor: UIColor
        init(
            topLineGradientStartColor: UIColor = Colors.blue,
            topLineGradientFinishColor: UIColor = Colors.red,
            bottomLineGradientStartColor: UIColor = Colors.blue,
            bottomLineGradientFinishColor: UIColor = Colors.red
        )
        {
            self.topLineGradientStartColor = topLineGradientStartColor
            self.topLineGradientFinishColor = topLineGradientFinishColor
            self.bottomLineGradientStartColor = bottomLineGradientStartColor
            self.bottomLineGradientFinishColor = bottomLineGradientFinishColor
        }
    }
    
    weak var delegate: BezierCornerEffectViewDelegate?
    
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
    
//    override func draw(_ rect: CGRect) {
//        self.createBottomSquare()
//        self.createTopSquare()
//    }
    
    func createTopSquare() {
        // Initialize the path.
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: self.frame.size.width/100*76, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width/100*84, y: self.frame.size.height/100*15))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height/100*12))
        
        // create the gradient based in model colors
        let gradient = CGGradient(
            colorsSpace: nil,
            colors: [
                model?.topLineGradientStartColor.cgColor,
                model?.topLineGradientFinishColor.cgColor]
                as CFArray, locations: nil)!

        // Draw the stroke and apply the gradient
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(2)
        context.addPath(path.cgPath)
        context.replacePathWithStrokedPath()
        context.clip()
        context.drawLinearGradient(gradient,
                                   start: CGPoint(x: self.frame.size.width/100*76, y: 0.0),
                                   end: CGPoint(x: self.frame.size.width, y: self.frame.size.height/100*12),
                                   options: [])
        
    }
    
    func createBottomSquare() {
        // Initialize the path.
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height/100*40))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.height/100*68))
        path.addLine(to: CGPoint(x: self.frame.size.width/100*55, y: self.frame.height/100*60))
        path.close()
        
        // Specify the stroke gradient and apply it to the path.
        
    }
    
    
}
