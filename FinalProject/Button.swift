//
//  Button.swift
//  FinalProject
//
//  Created by Jenn Le on 12/10/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation

class Button: Task {
    fileprivate var nTimes = 0
    
    override func setupTask() {
        nTimes = Int(arc4random_uniform(10)) + 1
    }
}
