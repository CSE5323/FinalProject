//
//  FindWest.swift
//  FinalProject
//
//  Created by Jenn Le on 12/13/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import CoreLocation

class FindWest: Task, CLLocationManagerDelegate {
    
    var location:CLLocationManager!
    
    override func setupTask() {
        print("FindWest >>>")
        
        DispatchQueue.main.async {
            self.location = CLLocationManager()
            self.location.delegate = self
            
            self.location.startUpdatingHeading()
        }
    }
    
    func locationManager(_: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("Heading: " + String(newHeading.trueHeading))
        if newHeading.trueHeading < 285 && newHeading.trueHeading > 255 {
            self.location.stopUpdatingHeading()
            print("<<< FindWest")
            doneTask()
        }
    }
}
