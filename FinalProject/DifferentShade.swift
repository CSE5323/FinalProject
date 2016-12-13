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
    
    //Linking buttons
    @IBOutlet weak var b00: UIButton!
    @IBOutlet weak var b01: UIButton!
    @IBOutlet weak var b02: UIButton!
    @IBOutlet weak var b03: UIButton!
    @IBOutlet weak var b04: UIButton!
    @IBOutlet weak var b05: UIButton!
    @IBOutlet weak var b10: UIButton!
    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var b12: UIButton!
    @IBOutlet weak var b13: UIButton!
    @IBOutlet weak var b14: UIButton!
    @IBOutlet weak var b15: UIButton!
    @IBOutlet weak var b20: UIButton!
    @IBOutlet weak var b21: UIButton!
    @IBOutlet weak var b22: UIButton!
    @IBOutlet weak var b23: UIButton!
    @IBOutlet weak var b24: UIButton!
    @IBOutlet weak var b25: UIButton!
    @IBOutlet weak var b30: UIButton!
    @IBOutlet weak var b31: UIButton!
    @IBOutlet weak var b32: UIButton!
    @IBOutlet weak var b33: UIButton!
    @IBOutlet weak var b34: UIButton!
    @IBOutlet weak var b35: UIButton!
    @IBOutlet weak var b40: UIButton!
    @IBOutlet weak var b41: UIButton!
    @IBOutlet weak var b42: UIButton!
    @IBOutlet weak var b43: UIButton!
    @IBOutlet weak var b44: UIButton!
    @IBOutlet weak var b45: UIButton!
    @IBOutlet weak var b50: UIButton!
    @IBOutlet weak var b51: UIButton!
    @IBOutlet weak var b52: UIButton!
    @IBOutlet weak var b53: UIButton!
    @IBOutlet weak var b54: UIButton!
    @IBOutlet weak var b55: UIButton!
    @IBOutlet weak var b60: UIButton!
    @IBOutlet weak var b61: UIButton!
    @IBOutlet weak var b62: UIButton!
    @IBOutlet weak var b63: UIButton!
    @IBOutlet weak var b64: UIButton!
    @IBOutlet weak var b65: UIButton!
    @IBOutlet weak var b70: UIButton!
    @IBOutlet weak var b71: UIButton!
    @IBOutlet weak var b72: UIButton!
    @IBOutlet weak var b73: UIButton!
    @IBOutlet weak var b74: UIButton!
    @IBOutlet weak var b75: UIButton!
    @IBOutlet weak var b80: UIButton!
    @IBOutlet weak var b81: UIButton!
    @IBOutlet weak var b82: UIButton!
    @IBOutlet weak var b83: UIButton!
    @IBOutlet weak var b84: UIButton!
    @IBOutlet weak var b85: UIButton!
    @IBOutlet weak var b90: UIButton!
    @IBOutlet weak var b91: UIButton!
    @IBOutlet weak var b92: UIButton!
    @IBOutlet weak var b93: UIButton!
    @IBOutlet weak var b94: UIButton!
    @IBOutlet weak var b95: UIButton!
    
    fileprivate var diffColor = UIColor(colorLiteralRed: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    
    override func setupTask() {
        let (red, green, blue) = generateColor()
        let color = UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1.0)
        diffColor = UIColor(red: CGFloat(red)/255 + 0.05, green: CGFloat(green)/255 + 0.05, blue: CGFloat(blue)/255 + 0.05, alpha: 1.0)
        let buttons: [[UIButton?]] = [[b00, b01, b02, b03, b04, b05],
                       [b10, b11, b12, b13, b14, b15],
                       [b20, b21, b22, b23, b24, b25],
                       [b30, b31, b32, b33, b34, b35],
                       [b40, b41, b42, b43, b44, b45],
                       [b50, b51, b52, b53, b54, b55],
                       [b60, b61, b62, b63, b64, b65],
                       [b70, b71, b72, b73, b74, b75],
                       [b80, b81, b82, b83, b84, b85],
                       [b90, b91, b92, b93, b94, b95]]
        for row in buttons {
            for box in row {
                box?.backgroundColor = color
            }
        }
        generatePosition(grid: buttons).backgroundColor = diffColor
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if (sender as AnyObject).backgroundColor == diffColor {
            doneTask()
        }
    }
    
    func generateColor() -> (Int, Int, Int) {
        let red = Int(arc4random_uniform(255) + 1)
        let green = Int(arc4random_uniform(255) + 1)
        let blue = Int(arc4random_uniform(255) + 1)
        
        return (red, green, blue)
    }
    
    func generatePosition( grid:[[UIButton?]] ) -> UIButton {
        let x = Int(arc4random_uniform(9))
        let y = Int(arc4random_uniform(5))
        
        let coords = grid[x][y]
        return coords!
    }
}
