//
//  ViewController.swift
//  MatomoDemo
//
//  Created by Mani Sedighi on 21/01/2019.
//  Copyright © 2019 Mani Sedighi. All rights reserved.
//

import UIKit
import MatomoTracker

class ViewController: UIViewController {
    
    let matomo = TrackerClass()
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var acceptance: UISwitch!
    @IBOutlet weak var presidentVlad: UISwitch!
    @IBOutlet weak var startBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        matomo.matomoTracker.startNewSession()
        matomo.matomoTracker.dispatch()
        //matomo.matomoTracker.track(view: ["Start"])
        
    }

    @IBAction func startButton(_ sender: UIButton) {
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startProcess" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.person = Person.init(name: userName.text!, gender: gender.text!, firstSwitch: acceptance.isOn, secondSwitch: presidentVlad.isOn)
        }
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

