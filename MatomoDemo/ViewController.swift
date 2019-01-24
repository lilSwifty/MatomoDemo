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

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var patient: UISwitch!
    @IBOutlet weak var clinic: UISwitch!
    @IBOutlet weak var startBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
//        Tracker.shared.setCustomVariable(Tracker.shared.customVar1)
        Tracker.shared.trackView("StartVC")
        
    }

    @IBAction func startButton(_ sender: UIButton) {
        if patient.isOn {
            Tracker.shared.setCustomVariable(Tracker.shared.customVar1)
        } else if clinic.isOn {
            Tracker.shared.setCustomVariable(Tracker.shared.customVar3)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startProcess" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.person = Person.init(name: userName.text!, gender: gender.text!, firstSwitch: patient.isOn, secondSwitch: clinic.isOn)
        }
    }
    
    @IBAction func patientSwitch(_ sender: UISwitch) {
        clinic.isEnabled = !patient.isOn
        
        
    }
    
    @IBAction func clinicSwitch(_ sender: UISwitch) {
        patient.isEnabled = !clinic.isOn
        
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

