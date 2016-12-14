//
//  TiltBackward.swift
//  FinalProject
//
//  Created by Ashley Isles on 12/13/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion


class TiltBackward: Task {
    
    let motionManager = CMMotionManager()
    override func setupTask() {
        print("TiltBackward >>>")
        
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main){
            (data, error) in
            
            
            if let acceleration = data?.acceleration {
                
                if(0.8 < acceleration.z && acceleration.z < 1.2){
                    self.motionManager.stopAccelerometerUpdates()
                    print("<<< TiltBackward")
                    self.doneTask()
                }
            }
            
        }
    }
}
