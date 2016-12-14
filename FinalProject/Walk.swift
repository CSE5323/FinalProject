//
//  Walk.swift
//  FinalProject
//
//  Created by Preston Tighe on 12/12/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import UIKit
import CoreMotion

class Walk: Task {
    
    @IBOutlet var statusLabel: UILabel!
    //MARK: class variables
    let activityManager = CMMotionActivityManager()
    let motionQueue = OperationQueue()
    let motion = CMMotionManager()
    
    override func setupTask() {
        print("Walk >>>")
        
        self.startActivityMonitoring()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Activity Functions
    func startActivityMonitoring(){
        if CMMotionActivityManager.isActivityAvailable(){
            self.activityManager.startActivityUpdates(to: motionQueue, withHandler: self.handleActivity)
        }
        
    }
    
    func handleActivity(activity:CMMotionActivity?)->Void{
        // unwrap the activity and disp
        if let unwrappedActivity = activity {
            switch true{
                case unwrappedActivity.walking:
                    self.activityManager.stopActivityUpdates()
                    print("<<< Walk")
                    doneTask()
                default:
                    break
            }
        }
    }

    
    
}


