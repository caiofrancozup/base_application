//
//  AppDelegate.swift
//  POC
//
//  Created by Bruno Vieira on 23/12/19.
//  Copyright © 2019 Bruno Vieira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var applicationCoordinator: Coordinator?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navController = UINavigationController()
        applicationCoordinator = AppCoordinator(navigationController: navController)
        applicationCoordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }

}

// MARK: - Helper Extensios
private extension AppDelegate {
    
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    
//    func setupApplication() {
//    
//        UIView.setAnimationsEnabled(!isRunningUITests)
//        
//        if isRunningUnitTests && !isRunningUITests {
//            window = UIWindow()
//            window?.rootViewController = UIViewController()
//            window?.makeKeyAndVisible()
//        } else {
//            // Start App Coordinator
//            applicationCoordinator?.start()
//        }
//    }
}

private extension AppDelegate {
    
    var isRunningUnitTests: Bool {
        return ProcessInfo.processInfo.environment["XCInjectBundleInto"] != nil // this means that we are running unit tests
    }
    
    var isRunningUITests: Bool {
        var isRunningUITestsEnvironmentVariableValue = false
        if let isRunningUITests = ProcessInfo.processInfo.environment["IS_RUNNING_UI_TESTS"] { // this is injected on the scheme arguments
            isRunningUITestsEnvironmentVariableValue = isRunningUITests == "YES"
        }
        return ProcessInfo.processInfo.arguments.contains("UITestMode") || isRunningUITestsEnvironmentVariableValue
    }
    
}


