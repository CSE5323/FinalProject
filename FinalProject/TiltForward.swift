//
//  Tilt.swift
//  FinalProject
//
//  Created by Ashley Isles on 12/12/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion

class TiltForward: Task {
    
    @IBOutlet weak var label: UILabel!
    let motionManager = CMMotionManager()
    var already_turned_right = false
    var already_turned_back = false
//    let motionQueue = OperationQueue()
    
    override func setupTask() {
        
        already_turned_right = false
        already_turned_back = false
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main){
            (data, error) in
            
            
            
            if let acceleration = data?.acceleration {
                
                self.label.text = "\(acceleration.z) .2f"
                if(-1.1 < acceleration.z && acceleration.z < -0.9 && !self.already_turned_right){
                    self.already_turned_right = true
                }
                if(-0.1 < acceleration.z && acceleration.z < 0.1 && self.already_turned_right){
                    self.already_turned_back = true
                }
            }
            
            if(self.already_turned_right && self.already_turned_back){
                self.motionManager.stopAccelerometerUpdates()
                self.doneTask()
            }
            
        }
    }
}
