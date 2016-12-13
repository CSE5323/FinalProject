import Foundation
import UIKit

class Switch: Task {
    var randomStates = [Int]()
    
    @IBOutlet var switch1: UISwitch!
    @IBOutlet var switch2: UISwitch!
    @IBOutlet var switch3: UISwitch!
    @IBOutlet var switch4: UISwitch!
    @IBOutlet var switch5: UISwitch!
    @IBOutlet var label: UILabel!
    func randomBool() -> Bool {
        return arc4random_uniform(2) == 0
    }
    override func setupTask() {
        
        randomStates = [0,0,0,0,0]
        for _ in 0  ..< 100 {
            let randomIndex = Int(arc4random_uniform(4)) + 1
            randomStates[randomIndex] = randomStates[randomIndex] == 0 ? 1 : 0
        }
        var allFalse = true
        for i in 0  ..< 5 {
            if(randomStates[i] == 1){
                allFalse = false
                break
            }
            
        }
        if allFalse{
            randomStates[1] = 1
            randomStates[3] = 1
        }
        updateLabel()
    }
    private func updateLabel(){
        var stateStrings = [String]()
        for i in 0  ..< randomStates.count {
            
            switch randomStates[i] {
            case 0:
                stateStrings.append("OFF")
            case 1:
                stateStrings.append("ON")
            default:
                break
            }
        }
        label.text = stateStrings.joined(separator: ",")
    }
    @IBAction func switch1Changed(_ sender: Any) {
        checkTask()
    }
    @IBAction func switch2Changed(_ sender: Any) {
        checkTask()
    }
    @IBAction func switch3Changed(_ sender: Any) {
        checkTask()
    }
    @IBAction func switch4Changed(_ sender: Any) {
        checkTask()
    }
    @IBAction func switch5Changed(_ sender: Any) {
        checkTask()
    }
    func checkTask(){
        if(switch1.isOn == Bool(randomStates[0] as NSNumber) &&
            switch2.isOn == Bool(randomStates[1] as NSNumber) &&
            switch3.isOn == Bool(randomStates[2] as NSNumber) &&
            switch4.isOn == Bool(randomStates[3] as NSNumber) &&
            switch5.isOn == Bool(randomStates[4] as NSNumber)){
            doneTask()
        }
    }
}
