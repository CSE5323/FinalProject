//
//  FindEast.swift
//  FinalProject
//
//  Created by Jenn Le on 12/13/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import CoreLocation

class FindEast: Task, CLLocationManagerDelegate {
    
    var location:CLLocationManager!
    var isDone = false
    
    override func setupTask() {
        print("FindEast >>>")
        
        isDone = false
        DispatchQueue.main.async {
            self.location = CLLocationManager()
            self.location.delegate = self
            
            self.location.startUpdatingHeading()
        }
    }
    
    func locationManager(_: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        if newHeading.trueHeading < 95 || newHeading.trueHeading > 85 {
            self.location.stopUpdatingHeading()
            print("<<< FindEast")
            doneTask()
        }
    }
}
