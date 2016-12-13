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
    
    func locationManager(_: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
//        print(newHeading.trueHeading)
        if abs(newHeading.trueHeading) < 5 {
            doneTask()
        }
    }
}
