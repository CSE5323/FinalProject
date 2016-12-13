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
        location = CLLocationManager()
        location.delegate = self
        
        location.startUpdatingHeading()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func locationManager(manager: CLLocationManager!, didUpdateHeading newHeading: CLHeading!) {
        if abs(newHeading.trueHeading) < 10 {
            doneTask()
        }
    }
}
