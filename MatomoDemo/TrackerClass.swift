//
//  TrackerClass.swift
//  MatomoDemo
//
//  Created by Mani Sedighi on 22/01/2019.
//  Copyright © 2019 Mani Sedighi. All rights reserved.
//

import UIKit
import MatomoTracker

class TrackerClass: NSObject {

    let matomoTracker = MatomoTracker(siteId: "5", baseURL: URL(string: "https://analytics.visibacare.com/piwik.php")!)
    
    func eventCategory(string1: String, string2: String) {
        matomoTracker.track(eventWithCategory: string1, action: string2)
    }
}
