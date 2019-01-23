//
//  FirstButtonViewController.swift
//  MatomoDemo
//
//  Created by Mani Sedighi on 22/01/2019.
//  Copyright © 2019 Mani Sedighi. All rights reserved.
//

import UIKit
import MatomoTracker

class FirstButtonViewController: UIViewController {

    let matomo = TrackerClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //matomo.matomoTracker.track(view: ["Start", "SecondVC", "FirstBtnVC"])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        matomo.matomoTracker.dispatch()
    }
    

}
