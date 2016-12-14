import AVFoundation
import UIKit

class Beep: Task, UITextFieldDelegate {
    
    @IBOutlet var myTextField: UITextField!
    var maxBeeps = 0
    override func setupTask() {
        print("Beep >>>")
        
        maxBeeps = randomInt(min: 1, max: 3)
        
        let systemSoundID: SystemSoundID = 1016
        
        for i in 0  ..< maxBeeps {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(i * 1), execute: {
                print("play sound")
                AudioServicesPlaySystemSound (systemSoundID)
            })
        }
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Beep.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        self.myTextField.delegate = self;
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    @IBAction func endedEditing(_ sender: UITextField) {
        if let textInput = Int(sender.text!){
            if(textInput == maxBeeps){
                print("<<< Beep")
                doneTask()
            }
        }
    }
}
