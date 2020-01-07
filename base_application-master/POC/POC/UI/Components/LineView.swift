//
//  LineView.swift
//  POC
//
//  Created by Bruno Vieira on 05/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

class LineView: CustomView<LineView.Model?> {

    struct Model: CustomViewModel {
        let lineType: LineType
        let color: UIColor

        enum LineType {
            case none
            case dashed
            case continuous
        }

        init(lineType: LineType = .none, color: UIColor = .clear) {
            self.lineType = lineType
            self.color = color
        }
    }

    private var alreadyDrawedDashedLine = false
    
    override public func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        updatePath()
    }
    
    override public func didUpdateModel() {
        super.didUpdateModel()
        guard let model = model else { return }

        isHidden = model.lineType == .none

        switch model.lineType {
        case .none:
            backgroundColor = .clear
        case .dashed:
            backgroundColor = .clear
        case .continuous:
            backgroundColor = model.color
        }
    }
    
    private func updatePath() {
        guard let model = model,
            !alreadyDrawedDashedLine,
            model.lineType == .dashed else { return }

        alreadyDrawedDashedLine = true
        
        let Bpath = UIBezierPath()
        
        let  p0 = CGPoint(x: bounds.minX, y: bounds.midY)
        Bpath.move(to: p0)
    
        let  p1 = CGPoint(x: bounds.maxX, y: bounds.midY)
        Bpath.addLine(to: p1)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = model.color.cgColor
        shapeLayer.lineWidth = frame.height
        shapeLayer.lineDashPattern = [5, 5]
        
        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
    
}
