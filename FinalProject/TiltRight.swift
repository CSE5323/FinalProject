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

class TiltRight: Task {
    
//    @IBOutlet weak var steve: UIImageView!
    @IBOutlet weak var label: UILabel!
    let motionManager = CMMotionManager()
//    let motionQueue = OperationQueue()
    let motion = CMMotionManager()
    let pi = M_PI
    
    override func setupTask() {

            motionManager.startAccelerometerUpdates()
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.main){
                (data, error) in

                
                if let acceleration = data?.acceleration {
                    
                    //Facing down
                    let rotation = atan2(acceleration.x, acceleration.y) - M_PI
                    self.label.text = "\(rotation) .2f"
                    
                    //I'm pushing this up now but it doesn't work, i'm still messing with it 
                    //AI
                    if(rotation == 90)
                    {
                        self.motionManager.stopAccelerometerUpdates()
                        self.doneTask()
                    }

                }
                
            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
