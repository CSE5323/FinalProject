//
//  RunInPlace.swift
//  FinalProject
//
//  Created by Ashley Isles on 12/12/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import UIKit
import CoreMotion

class RunInPlace: Task {
    
    @IBOutlet var statusLabel: UILabel!
    //MARK: class variables
    let activityManager = CMMotionActivityManager()
    let motionQueue = OperationQueue()
    let motion = CMMotionManager()
    
    override func setupTask() {
        print("RunInPlace >>>")
        
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
            case unwrappedActivity.running:
                self.activityManager.stopActivityUpdates()
                print("<<< RunInPlace")
                doneTask()
            default:
                break
            }
        }
    }
    
    
    
}
