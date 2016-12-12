//
//  Button.swift
//  FinalProject
//
//  Created by Jenn Le on 12/10/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import UIKit

class Slide: Task {
    @IBOutlet var slide: UISlider!
    
    override func setupTask() {
    }
    @IBAction func slideChanged(_ sender: UISlider) {
        if(sender.value == 1){
            doneTask()
        }
    }
}
