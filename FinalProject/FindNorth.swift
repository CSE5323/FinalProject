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
    
    override func setupTask() {
        print("FindNorth >>>")
        
        DispatchQueue.main.async {
            self.location = CLLocationManager()
            self.location.delegate = self
            
            self.location.startUpdatingHeading()
        }
    }
    
    func locationManager(_: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        if newHeading.trueHeading < 5 || newHeading.trueHeading > 355 {
            self.location.stopUpdatingHeading()
            print("<<< FindNorth")
            doneTask()
        }
        
    }
}
