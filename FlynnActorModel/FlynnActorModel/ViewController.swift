//
//  ViewController.swift
//  FlynnActorModel
//
//  Created by YuCheng on 2021/2/8.
//

import UIKit
import Flynn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClickAction(sender: UIButton) {
        print("synchronous: before")
        HelloFlynnActor().beSayHello()
        print("synchronous: after")
        Flynn.shutdown()
    }

}

