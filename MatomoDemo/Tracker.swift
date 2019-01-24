//
//  TrackerClass.swift
//  MatomoDemo
//
//  Created by Mani Sedighi on 22/01/2019.
//  Copyright © 2019 Mani Sedighi. All rights reserved.
//

import UIKit
import MatomoTracker

class Tracker: NSObject {
    
    static let shared = Tracker()
    
    let customVar1 = CustomVariable(index: 1, name: "VisitorType", value: "Patient")
    let customVar2 = CustomVariable(index: 2, name: "VisitorType", value: "Family")
    let customVar3 = CustomVariable(index: 3, name: "CustomerType", value: "Hospital")
    let customVar4 = CustomVariable(index: 3, name: "CustomerType", value: "Clinic")
    let customVar5 = CustomVariable(index: 3, name: "CustomerType", value: "Doctor")
    
    var userID : String? {
        didSet{
            matomo.userId = userID
        }
    }
    
    private let matomo = MatomoTracker(siteId: "5", baseURL: URL(string: "https://analytics.visibacare.com/piwik.php")!)
    
    func trackEvent(category: String, action: String) {
        matomo.track(eventWithCategory: category, action: action, name: nil, number: nil, url: nil)
        
        matomo.debugDispatch()
    }
    
    func trackView(_ view: String){
        matomo.track(view: [view])
        
        matomo.debugDispatch()
    }
    
    func startNewSession(){
        matomo.startNewSession()
    }
    
    func setCustomVariable(_ customVariable: CustomVariable){
        matomo.set(customVariable: customVariable)
    }
    
}

extension MatomoTracker {
    func debugDispatch() {
        #if DEBUG
        dispatch()
        #endif
    }
}

