//
//  Alert.swift
//  POC
//
//  Created by Bruno Vieira on 30/12/19.
//  Copyright © 2019 Bruno Vieira. All rights reserved.
//

import UIKit

class Alert {
    
    static func showAlert(in controller: UIViewController,
                          withTitle title: String?,
                          message: String?,
                          preferredStyle: UIAlertController.Style = .alert,
                          action: UIAlertAction? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action ?? defaultAction)
        controller.present(alertController, animated: true, completion: nil)
    }
    
    static func showAlert(in controller: UIViewController,
                          withTitle title: String?,
                          message: String?,
                          preferredStyle: UIAlertController.Style = .alert,
                          leftAction: UIAlertAction!,
                          rightAction: UIAlertAction? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alertController.addAction(leftAction)
        alertController.addAction(rightAction ?? UIAlertAction(title: "Cancel", style: .default, handler: nil))
        controller.present(alertController, animated: true, completion: nil)
    }
    
    static func showAlert(in controller: UIViewController,
                          withTitle title: String?,
                          message: String?,
                          preferredStyle: UIAlertController.Style = .alert,
                          yesAction: UIAlertAction!,
                          noAction: UIAlertAction? = nil) {
        showAlert(in: controller,
                  withTitle: title,
                  message: message,
                  preferredStyle: preferredStyle,
                  leftAction: yesAction,
                  rightAction: noAction ?? UIAlertAction(title: "No", style: .default, handler: nil))
    }
    
}
