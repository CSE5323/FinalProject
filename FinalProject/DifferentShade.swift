//
//  DifferentShade.swift
//  FinalProject
//
//  Created by Jenn Le on 12/12/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import UIKit

class DifferentShade: Task {
    
    override func setupTask() {
        
        
    }
    
    
    
    func generateColor() -> (Int, Int, Int) {
        let red = Int(arc4random_uniform(255) + 1)
        let green = Int(arc4random_uniform(255) + 1)
        let blue = Int(arc4random_uniform(255) + 1)
        
        return (red, green, blue)
    }
    
    func generatePosition() -> String {
        let x = Int(arc4random_uniform(10))
        let y = Int(arc4random_uniform(10))
        
        let coords = String(x) + String(y)
        return coords
    }
}
