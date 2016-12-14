import Foundation
import UIKit

class Switch: Task {
    var randomStates = [Int]()
    var randomStateCount = 5
    
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
        print("Switch  >>>")
        
        switch1.isOn = false
        switch2.isOn = false
        switch3.isOn = false
        switch4.isOn = false
        switch5.isOn = false
        
        var allFalse = true
        randomStates = []
        for _ in 0  ..< randomStateCount {
            randomStates.append(randomInt(min: 0, max: 1))
        }
        for i in 0  ..< randomStateCount {
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
        DispatchQueue.main.async {
            self.label.text = stateStrings.joined(separator: "    ")
        }
        print("updateLabel: " + label.text!)
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
            print("<<< Switch")
            doneTask()
        }
    }
}
