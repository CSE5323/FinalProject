//
//  PinchScreen.swift
//  FinalProject
//
//  Created by Jenn Le on 12/12/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation

class PinchScreen: Task {
    override func setupTask() {
        
    }
    
    @IBAction func pinchedMonkey(_ sender: UIPinchGestureRecognizer) {
        print("pinched monkey")
        doneTask()
    }
}
