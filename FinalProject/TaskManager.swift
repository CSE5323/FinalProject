//
//  TaskManager.swift
//  FinalProject
//
//  Created by Preston Tighe on 12/11/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import GameplayKit

class TaskManager {
    
    //Here for testing purposes
    static let prestonTaskNames = ["Button", "Slide", "Swipe", "FlatSurface", "HandOverCamera", "Shake", "Switch", "Clap", "FingerDown", "Beep", "TurnLeft", "TurnRight"]
    static let jennTaskNames = ["DoMath", "DifferentShade", "PinchScreen", "FindAFriend", "FindNorth", "FindEast", "FindSouth", "FindWest"]
    static let ashleyTaskNames = ["TiltForward", "TiltBackward"]
    
    static let moveTaskNames = ["Walk", "RunInPlace"]
    
    //Change this to the task you are testing, else blank will add all the tasks together
    static var taskNames = ["Button", "Slide", "Swipe", "FlatSurface", "HandOverCamera", "Shake", "Switch", "Clap", "FingerDown", "Beep", "TurnLeft", "TurnRight","DoMath", "DifferentShade", "PinchScreen", "FindAFriend", "FindNorth", "FindEast", "FindSouth", "FindWest","TiltForward", "TiltBackward"]
//    static var taskNames = ["PinchScreen"]
    
    static var testMode = false
    static var totalTasksDone = 0
    static var runMode = "count"
    static var randomModeMaxTasks = 3
    static var canDoMoveTasks = true
    static var startTime = NSDate()
    static var endTime = NSDate()
    
    static func setup(){
        //First time
        if(TaskManager.taskNames.count == 0){
            TaskManager.taskNames.append(contentsOf: TaskManager.prestonTaskNames)
            TaskManager.taskNames.append(contentsOf: TaskManager.jennTaskNames)
            TaskManager.taskNames.append(contentsOf: TaskManager.ashleyTaskNames)
            TaskManager.testMode = false
        }else{
            TaskManager.testMode = true
        }
        
        if(!TaskManager.testMode){
            //Move task filtering
            for moveTaskName in moveTaskNames{
                TaskManager.taskNames = TaskManager.taskNames.filter { $0 != moveTaskName }
            }
            if(canDoMoveTasks){
                TaskManager.taskNames.append(contentsOf: TaskManager.moveTaskNames)
            }
        }
        
        //Randomize the task names
        TaskManager.taskNames = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: TaskManager.taskNames) as! [String]
    }
}
