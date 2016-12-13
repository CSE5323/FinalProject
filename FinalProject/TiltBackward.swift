//
//  TiltLeft.swift
//  FinalProject
//
//  Created by Ashley Isles on 12/13/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion


class TiltBackward: Task {
    
    @IBOutlet weak var label_left: UILabel!
    let motionManager = CMMotionManager()
    var already_turned_backward = false
    var already_turned_forward = false
    //    let motionQueue = OperationQueue()
    
    override func setupTask() {
        
        already_turned_backward = false
        already_turned_forward = false
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main){
            (data, error) in
            
            
            if let acceleration = data?.acceleration {
                
                self.label_left.text = "\(acceleration.z) .2f"
                if(0.9 < acceleration.z && acceleration.z < 1.1 && !self.already_turned_backward){
                    self.already_turned_backward = true
                }
                if(-0.1 < acceleration.z && acceleration.z < 0.1 && self.already_turned_backward){
                    self.already_turned_forward = true
                }
            }
            
            if(self.already_turned_backward && self.already_turned_forward){
                self.motionManager.stopAccelerometerUpdates()
                self.doneTask()
            }
            
        }
    }
}
