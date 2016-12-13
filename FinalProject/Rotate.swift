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
    
    
    override func setupTask() {
        
    }
    
    @IBOutlet weak var label: UIImageView!
    
    
    @IBAction func handleRotate(recognizer : UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            label.transform = label.transform.rotated(by: recognizer.rotation)
            
            recognizer.rotation = 0
        }
    }

    
}
