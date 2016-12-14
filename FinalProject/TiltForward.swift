//
//  TiltForward.swift
//  FinalProject
//
//  Created by Ashley Isles on 12/12/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion

class TiltForward: Task {
    
    let motionManager = CMMotionManager()
    override func setupTask() {
        print("TiltForward >>>")
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main){
            (data, error) in
            
            
            
            if let acceleration = data?.acceleration {
                
                if(-1.2 < acceleration.z && acceleration.z < -0.8){
                    self.motionManager.stopAccelerometerUpdates()
                    print("<<< TiltForward")
                    self.doneTask()
                }
            }
            
        }
    }
}
