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
    
    let matomo = TrackerClass()
    let firstVC = ViewController()
    
    var person = Person(name: "Mani", gender: "M", firstSwitch: true, secondSwitch: false)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        userNameLabel.text = person.name
        
        //matomo.matomoTracker.track(view: ["Start", "SecondVC"])
        
        matomo.matomoTracker.isOptedOut = false
        
        //matomo.matomoTracker.userId = Bundle.main.infoDictionary!["CFBundleName"] as! String
        
        matomo.matomoTracker.userId = "\(person.name)"
        
        matomo.eventCategory(string1: "Gender", string2: "\(person.gender)")
        matomo.eventCategory(string1: "User accepts?", string2: person.firstSwitch.description)
        matomo.eventCategory(string1: "Is Vlad the president?", string2: person.secondSwitch.description)
        
        //checkTracker()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        matomo.matomoTracker.track(view: ["Start", "SecondVC"])
        matomo.matomoTracker.dispatch()
    }
    
    @IBAction func trackButton(_ sender: UIButton) {
        print("First Button Pressed!")
        matomo.eventCategory(string1: "first button pressed", string2: "hello?")
        //matomo.matomoTracker.isOptedOut = false
        
        //checkTracker()
    }
    
    
    @IBAction func uselessButton(_ sender: UIButton) {
        print("Second Button Pressed!")
        matomo.eventCategory(string1: "Second button", string2: "pressed")
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        print("Stop Button Pressed")
        //matomo.matomoTracker.track(view: ["tracker stopped"])
        //matomo.matomoTracker.isOptedOut = true
        
        //checkTracker()
    }
    
    func checkTracker(){
        if matomo.matomoTracker.isOptedOut {
            stopBtn.isEnabled = false
        } else {
            stopBtn.isEnabled = true
        }
    }
    
}
