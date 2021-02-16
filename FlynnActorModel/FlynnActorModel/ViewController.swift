//
//  ViewController.swift
//  FlynnActorModel
//
//  Created by YuCheng on 2021/2/8.
//

import UIKit
import Flynn

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    private var model = ViewModelActor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClickAction(sender: UIButton) {
        useViewModelActor()
    }
    
    private func sayHello() {
        print("synchronous: before")
        HelloFlynnActor().beSayHello()
        print("synchronous: after")
        Flynn.shutdown()
    }
    private func useConcurrentDatastore() {
        let monsters = ConcurrentDatastore()

        monsters.beSet("Goblin", Monster(name: "Goblin", hitpoints: 10, strength: 3, dexterity: 2, intelligence: 1))
        monsters.beSet("Orc", Monster(name: "Orc", hitpoints: 15, strength: 6, dexterity: 4, intelligence: 2))
        monsters.beSet("Troll", Monster(name: "Troll", hitpoints: 30, strength: 4, dexterity: 1, intelligence: 5))

        let scenario1 = Scenario1(monsters)
        let scenario2 = Scenario2(monsters)

        print("-------Show-------")
        scenario1.bePrint("Goblin")
        scenario1.bePrint("Orc")
        scenario1.bePrint("Troll")

        sleep(1)
        print("--------------")

        scenario2.bePrint("Troll")
        scenario2.bePrint("Orc")
        scenario2.bePrint("Goblin")

        Flynn.shutdown()
    }
    private func useViewModelActor() {
        model.beAddCountTextBlock { (title) in
            self.button.setTitle(title, for: .normal)
        }
    }
}

