//
//  PinchScreen.swift
//  FinalProject
//
//  Created by Jenn Le on 12/12/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation

class PinchScreen: Task {
    var isDone = false
    override func setupTask() {
        print("PinchScreen >>>")
        isDone = false
    }
    
    @IBAction func pinchedMonkey(_ sender:UIPinchGestureRecognizer) {
        
        if(!isDone){
            print("<<< PinchScreen")
            isDone = true
            doneTask()
        }
    }
}
