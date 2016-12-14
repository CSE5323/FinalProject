import Foundation
import UIKit

class FingerDown: Task {
    
    var isDone = false
    override func setupTask() {
        print("FingerDown >>>")
        isDone = false
    }
    @IBAction func longPress(_ sender: Any) {
        if(!isDone){
            print("<<< FingerDown")
            isDone = true
            doneTask()
        }
        
    }
}
