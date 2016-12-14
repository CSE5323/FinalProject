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
    
    override func setupTask() {
        print("FindSouth >>>")
        
        DispatchQueue.main.async {
            self.location = CLLocationManager()
            self.location.delegate = self
            
            self.location.startUpdatingHeading()
        }
    }
    
    func locationManager(_: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("Heading: " + String(newHeading.trueHeading))
        if newHeading.trueHeading > 175 && newHeading.trueHeading < 185 {
            self.location.stopUpdatingHeading()
            print("<<< FindEast")
            doneTask()
        }
    }
}
