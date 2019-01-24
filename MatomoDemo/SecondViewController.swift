//
//  SecondViewController.swift
//  MatomoDemo
//
//  Created by Mani Sedighi on 21/01/2019.
//  Copyright © 2019 Mani Sedighi. All rights reserved.
//

import UIKit
import MatomoTracker

class SecondViewController: UIViewController {

    @IBOutlet weak var trackBtn: UIButton!
    @IBOutlet weak var uselessBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    
    let firstVC = ViewController()
    
    var person = Person(name: "Mani", gender: "M", firstSwitch: true, secondSwitch: false)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        userNameLabel.text = person.name
        
        Tracker.shared.userID = person.name
//        Tracker.shared.setCustomVariable(Tracker.shared.customVar5)
        Tracker.shared.trackEvent(category: "Gender", action: person.gender)
        Tracker.shared.trackEvent(category: "User accept", action: "\(person.firstSwitch)")
        Tracker.shared.trackEvent(category: "Vlad", action: "\(person.secondSwitch)")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Tracker.shared.trackView("SecondVC")
        
    }
    
    @IBAction func trackButton(_ sender: UIButton) {
        print("First Button Pressed!")
        Tracker.shared.trackEvent(category: "first button pressed", action: "hello?")
        
    }
    
    
    @IBAction func uselessButton(_ sender: UIButton) {
        print("Second Button Pressed!")
        Tracker.shared.trackEvent(category: "Second button pressed", action: "pressed")
        //matomo.eventCategory(string1: "Second button", string2: "pressed")
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        print("Stop Button Pressed")
        
        
    }
    
}
