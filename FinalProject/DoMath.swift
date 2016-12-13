//
//  DoMath.swift
//  FinalProject
//
//  Created by Jenn Le on 12/12/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import UIKit

class DoMath: Task, UITextFieldDelegate {
    
    @IBOutlet var op1: UILabel!
    @IBOutlet var symbol: UILabel!
    @IBOutlet var op2: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    fileprivate var answer: Int = 0
    
    override func setupTask() {
        textField.delegate = self
        let (one, sym, two) = generateProblem()
        op1.text = String(one)
        symbol.text = sym
        op2.text = String(two)
        
        switch sym {
        case "+":
            answer = one + two
        case "-":
            answer = one - two
        case "×":
            answer = one * two
        default:
            break
        }
        
//        print(answer)
    }
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if textField.text == String(answer) {
            doneTask()
//            print("Should've left")
        }
        
        return true
    }
    
    
    func generateProblem() -> (Int, String, Int) {
        let one = arc4random_uniform(13)
        let symNum = arc4random_uniform(3)
        let two = arc4random_uniform(13)
        
        var sym = ""
        
        switch symNum {
        case 0:
            sym = "+"
        case 1:
            sym = "-"
        case 2: sym = "×"
        default:
            break
        }
        
        return (Int(one), sym, Int(two))
    }
}
