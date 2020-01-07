//
//  ThirdViewModel.swift
//  POC
//
//  Created by Bruno Vieira on 03/01/20.
//  Copyright © 2020 Bruno Vieira. All rights reserved.
//

import UIKit

final class ThirdViewModel {
    
    private let coordinator: ThirdCoordinator
    
    init(
        coordinator: ThirdCoordinator
    ) {
        self.coordinator = coordinator
    }
    
    func getModel() -> ThirdView.Model {
        let progress = CGFloat(Double.random(in: 0.0..<1.0))
        let progressValueText = "\(progress)"
        return ThirdView.Model(progress: progress,
                               progressValueText: progressValueText)
    }
    
    func closeFeature() {
        coordinator.finish()        
    }
    
}
