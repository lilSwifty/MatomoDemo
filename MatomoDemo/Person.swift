//
//  Person.swift
//  MatomoDemo
//
//  Created by Mani Sedighi on 22/01/2019.
//  Copyright © 2019 Mani Sedighi. All rights reserved.
//

import UIKit

class Person: NSObject {

    let name: String
    let gender: String
    let firstSwitch: Bool
    let secondSwitch: Bool
    
    init(name: String, gender: String, firstSwitch: Bool, secondSwitch: Bool) {
        self.name = name
        self.gender = gender
        self.firstSwitch = firstSwitch
        self.secondSwitch = secondSwitch
    }
}
