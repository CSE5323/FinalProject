//
//  TapButton.swift
//  FinalProject
//
//  Created by Jenn Le on 12/10/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation

class TapButton: Task {
    fileprivate var nTimes = 0
    
    override func performTask() {
        updateButtonTask()
    }
    
    fileprivate func updateButtonTask() {
        nTimes = Int(arc4random_uniform(10)) + 1
        instructions = "Tap the button " + String(nTimes) + " times!"
    }
}
