//
//  Rotate.swift
//  FinalProject
//
//  Created by Ashley Isles on 12/13/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import UIKit

class Rotate: Task {
    
//    @IBOutlet weak var label: UIImageView!
    
    override func setupTask() {
        
    }
    
//    @IBAction func handleRotate(recognizer : UIRotationGestureRecognizer) {
//
//            label.transform = label.transform.rotated(by: recognizer.rotation)
//            
//            recognizer.rotation = 0
//        
//    }
    
    @IBAction func handleRotate(_ sender: UIRotationGestureRecognizer) {
        
        sender.view?.transform = (sender.view?.transform.rotated(by: sender.rotation))!
        
        doneTask()
    }


    
}
