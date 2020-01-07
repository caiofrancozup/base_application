//
//  ProgressBarView.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import Foundation
import UIKit

class ProgressBarView: CustomView<ProgressBarView.Model?> {
    
    private var path: UIBezierPath?
    private var backgroundLayer: CAShapeLayer?
    private var progressLayer: CAShapeLayer?
    
    struct Model: CustomViewModel {
        let progress: CGFloat
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        createProgressPath()
    }
    
    private func createBackgroundPath() {
        backgroundLayer?.removeFromSuperlayer()
        let radius = frame.height/2
        path = UIBezierPath()
        guard let path = path else { return }
        path.move(to: CGPoint(x: radius, y: 0))
        path.addLine(to: CGPoint(x: frame.width - radius, y: 0))
        path.addArc(withCenter: CGPoint(x: frame.width - radius, y: radius),
                    radius: radius,
                    startAngle: CGFloat(270).toRadians(),
                    endAngle: CGFloat(90).toRadians(),
                    clockwise: true)
        path.addLine(to: CGPoint(x: radius, y: frame.height))
        path.addLine(to: CGPoint(x: radius, y: 0))
        path.addArc(withCenter: CGPoint(x: radius,y: radius),
                    radius: radius,
                    startAngle: CGFloat(90).toRadians(),
                    endAngle: CGFloat(270).toRadians(),
                    clockwise: true)
        path.close()
        
        backgroundLayer = CAShapeLayer()
        guard let backgroundLayer = backgroundLayer else { return }
        backgroundLayer.path = path.cgPath
        backgroundLayer.fillColor = UIColor.lightGray.cgColor
        
        layer.addSublayer(backgroundLayer)
    }
    
    private func createProgressPath() {
        guard var progress = model?.progress else { return }
        progressLayer?.removeFromSuperlayer()
        let radius = frame.height/2
        if progress == 0 { return }
        if progress * (frame.width - radius) < radius {
            progress = radius / (frame.width - radius)
        }
        let path = UIBezierPath()
        path.move(to: CGPoint(x: radius, y: 0))
        path.addLine(to: CGPoint(x: progress * (frame.width - radius), y: 0))
        path.addArc(withCenter: CGPoint(x: progress * (frame.width - radius), y: frame.height/2),
                    radius: radius,
                    startAngle: CGFloat(270).toRadians(),
                    endAngle: CGFloat(90).toRadians(),
                    clockwise: true)
        path.addLine(to: CGPoint(x: radius, y: frame.height))
        path.addArc(withCenter: CGPoint(x: radius, y: frame.height/2),
                    radius: radius,
                    startAngle: CGFloat(90).toRadians(),
                    endAngle: CGFloat(270).toRadians(),
                    clockwise: true)
        path.close()
        
        progressLayer = CAShapeLayer()
        guard let progressLayer = progressLayer else { return }
        progressLayer.path = path.cgPath
        progressLayer.fillColor = UIColor.white.cgColor
        
        layer.addSublayer(progressLayer)
    }
    
    override func draw(_ rect: CGRect) {
        createBackgroundPath()
        createProgressPath()
    }
}
