//
//  Shake.swift
//  FinalProject
//
//  Created by Preston Tighe on 12/12/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import UIKit
import CoreMotion

class Shake: Task {
    var isActive = false
    
    override func setupTask() {
        print("Shake >>>")
        
        self.becomeFirstResponder()
        isActive = true;
    }
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake  && isActive{
            isActive = false
            self.resignFirstResponder()
            print("<<< Shake")
            doneTask()
        }
    }

    
    
}
