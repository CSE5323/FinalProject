//
//  TaskManager.swift
//  FinalProject
//
//  Created by Preston Tighe on 12/11/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation

class  TaskManager {

//    static let taskNames = ["Button", "Slide", "Swipe", "FlatSurface", "HandOverCamera", "Walk", "Shake", "Switch", "DoMath", "DifferentShade", "Clap", "PinchScreen", "FindAFriend", "FindNorth", "FingerDown", "Beep", "TurnLeft", "TurnRight"]
    
    //Here for testing purposes
    static let prestonTaskNames = ["Button", "Slide", "Swipe", "FlatSurface", "HandOverCamera", "Walk", "Shake", "Switch", "Clap", "FingerDown", "Beep", "TurnLeft", "TurnRight"]
    static let jennTaskNames = ["DoMath", "DifferentShade", "FindNorth", "PinchScreen", "FindAFriend"]
    
    //Change this to the task you are testing
    static let taskNames = ["DifferentShade"]
    
    static var totalTasksDone = 0
    static var runMode = "count"
    static var countModeMaxTasks = 3
    static var startTime = NSDate()
    static var endTime = NSDate()
}
