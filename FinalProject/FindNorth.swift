//
//  FindNorth.swift
//  FinalProject
//
//  Created by Jenn Le on 12/12/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import CoreLocation

class FindNorth: Task, CLLocationManagerDelegate {
    
    var location:CLLocationManager!
    var isDone = false
    
    override func setupTask() {
        print("FindNorth >>>")
        
        isDone = false
        DispatchQueue.main.async {
            self.location = CLLocationManager()
            self.location.delegate = self
            
            self.location.startUpdatingHeading()
        }
    }
    
    func locationManager(_: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        if abs(newHeading.trueHeading) < 5 {
            self.location.stopUpdatingHeading()
            print("<<< FindNorth")
            doneTask()
        }
    }
}
