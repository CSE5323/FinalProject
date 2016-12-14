//
//  FindSouth.swift
//  FinalProject
//
//  Created by Jenn Le on 12/13/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import CoreLocation

class FindSouth: Task, CLLocationManagerDelegate {
    
    var location:CLLocationManager!
    var isDone = false
    
    override func setupTask() {
        print("FindSouth >>>")
        
        isDone = false
        DispatchQueue.main.async {
            self.location = CLLocationManager()
            self.location.delegate = self
            
            self.location.startUpdatingHeading()
        }
    }
    
    func locationManager(_: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        if abs(newHeading.trueHeading) < 175 {
            self.location.stopUpdatingHeading()
            print("<<< FindNorth")
            doneTask()
        }
    }
}
