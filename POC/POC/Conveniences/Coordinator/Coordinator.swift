//
//  Coordinator.swift
//  POC
//
//  Created by Bruno Vieira on 23/12/19.
//  Copyright © 2019 Bruno Vieira. All rights reserved.
//

import Foundation
import UIKit

protocol CoordinatorInput {}
protocol CoordinatorOutput {}

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set}
    
    var childCoordinators: [String : Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func finish()
    
    func addChildCoordinator(_ coordinator: Coordinator) -> Bool
    func removeChildCoordinator(_ coordinator: Coordinator?) -> Bool
    
    func sendOutputToParent(_ output: CoordinatorOutput)
    func receiveChildOutput(child: Coordinator, output: CoordinatorOutput)
}

extension Coordinator {
    var identifier: String {
        return String(describing: type(of: self))
    }
}

extension Coordinator {
    
    // MARK: - Lifecycle
//    func start() { // Override if needed
//        debugPrint("start() called from: \(identifier)")
//    }
    
    func finish() { // Override if needed
        debugPrint("finish() called from: \(identifier)")
    }
    
    // MARK: - Helper Methods
    @discardableResult
    func addChildCoordinator(_ coordinator: Coordinator) -> Bool {
        if let _ = childCoordinators[coordinator.identifier] {
            return false
        }
        childCoordinators[coordinator.identifier] = coordinator
        coordinator.start()
        return true
    }
    
    @discardableResult
    func removeChildCoordinator(_ coordinator: Coordinator?) -> Bool {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else {
            return false
        }
        if let coordinatorToRemove = childCoordinators[coordinator.identifier] {
            childCoordinators.removeValue(forKey: coordinator.identifier)
            coordinatorToRemove.finish()
            return true
        }
        return false
    }
    
    func sendOutputToParent(_ output: CoordinatorOutput) {
        parentCoordinator?.receiveChildOutput(child: self, output: output)
    }
    
    func receiveChildOutput(child: Coordinator, output: CoordinatorOutput) {
        parentCoordinator?.receiveChildOutput(child: child, output: output)
    }
    
}
