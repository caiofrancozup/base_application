//
//  SwitchButton.swift
//  POC
//
//  Created by CaioFranco on 10/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

protocol SwitchButtonDelegate: class {
    func switchValueChanged(to value: Bool)
}

class SwitchButton: CustomView<SwitchButton.Model?> {
    
    struct Model: CustomViewModel {
        let sizeOfPoint: Int
        let activeColor: UIColor
        let deactiveColor: UIColor
        let backgroundActiveColor: UIColor
        let backgroundDeactiveColor: UIColor
        
        init(
            sizeOfPoint: Int = 25,
            activeColor: UIColor = Colors.blue,
            deactiveColor: UIColor = Colors.red,
            bgActiveColor: UIColor = Colors.lightBlue,
            bgDeactiveColor: UIColor = Colors.gray)
        {
            self.sizeOfPoint = sizeOfPoint
            self.activeColor = activeColor
            self.deactiveColor = deactiveColor
            self.backgroundActiveColor = bgActiveColor
            self.backgroundDeactiveColor = bgDeactiveColor
        }
    }
    
    private var switchActive: Bool = false
    weak var delegate: SwitchButtonDelegate?
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor =  model?.backgroundDeactiveColor
        view.layer.cornerRadius = CGFloat(model!.sizeOfPoint/2)-2
        let onTouchUpInside = UITapGestureRecognizer(target: self, action:  #selector(handleSwitchPressed))
        view.addGestureRecognizer(onTouchUpInside)
        return view
    }()
    
    private lazy var switchButton: UIButton = {
        let button = configureShadow()
        button.layer.cornerRadius = CGFloat(model!.sizeOfPoint/2)
        button.backgroundColor = model?.deactiveColor
        button.addTarget(self, action: #selector(handleSwitchPressed), for: .touchUpInside)
        return button
    }()
    
    override func addSubViews() {
        super.addSubViews()
        addSubview(backgroundView)
        backgroundView.addSubview(switchButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.anchorCenterToSuperview()
        
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor).isActive = true
        switchButton.anchorCenterYToSuperview()
    }
    
    @objc func handleSwitchPressed() {
        if (self.switchActive == false) {
            UIView.animateKeyframes(withDuration: 0.25, delay: 0.0, options: .beginFromCurrentState, animations: {
                self.switchButton.layer.frame.origin.x = CGFloat(Int(self.switchButton.layer.frame.origin.x) + (self.model?.sizeOfPoint)!)
                self.switchButton.backgroundColor =  self.model?.activeColor
                self.backgroundView.backgroundColor = self.model?.backgroundActiveColor
            }, completion: nil)
        } else {
            UIView.animateKeyframes(withDuration: 0.25, delay: 0.0, options: .beginFromCurrentState, animations: {
                self.switchButton.layer.frame.origin.x = 0
                self.switchButton.backgroundColor =  self.model?.deactiveColor
                self.backgroundView.backgroundColor = self.model?.backgroundDeactiveColor
            }, completion: nil)
        }
        self.switchActive = !self.switchActive
        delegate?.switchValueChanged(to: switchActive)
    }
    
    // Retorna um UIButton com Sombra
    func configureShadow() -> UIButton {
        let button = UIButton()
        button.layer.shadowColor = Colors.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2)
        button.layer.shadowRadius = 1
        button.layer.shadowOpacity = 0.3
        clipsToBounds = true
        button.layer.masksToBounds = false
        return button
    }
    
    override func didUpdateModel() {
        super.didUpdateModel()
        guard let model = model else { return }
        
        backgroundView.anchorSize(height: CGFloat(model.sizeOfPoint)-5, width: CGFloat(model.sizeOfPoint * 2))
        switchButton.anchorSize(height: CGFloat(model.sizeOfPoint), width: CGFloat(model.sizeOfPoint))
    }
}
