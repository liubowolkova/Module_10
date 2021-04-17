//
//  ViewController.swift
//  Module_10
//
//  Created by Любовь Волкова on 17.04.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set buttons style
        for button in buttons {
            button.layer.cornerRadius = 15
        }
    }
}

