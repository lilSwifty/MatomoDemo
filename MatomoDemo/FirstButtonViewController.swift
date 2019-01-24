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

    override func viewDidLoad() {
        super.viewDidLoad()

//        Tracker.shared.setCustomVariable(Tracker.shared.customVar2)
        Tracker.shared.trackView("FirstButton")

    }
}
