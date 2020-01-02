//
//  FirstViewController.swift
//  POC
//
//  Created by Bruno Vieira on 23/12/19.
//  Copyright © 2019 Bruno Vieira. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, Storyboarded {
    weak var coordinator: FirstCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First"
        // Do any additional setup after loading the view.
    }


}

