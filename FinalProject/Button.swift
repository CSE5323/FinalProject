import Foundation
import UIKit

class Button: Task {
    var maxClicks = 0
    var currentClicks = 0
    
    @IBOutlet var button: UIButton!
    @IBOutlet var instructionLabel: UILabel!
    
    override func setupTask() {
        print("Button  >>>")
        currentClicks = 0
        maxClicks = randomInt(min: 1, max: 5)
        DispatchQueue.main.async {
            self.instructionLabel.text = "Click " + String(self.maxClicks) + " times"
        }
        
        button.setTitle(" ", for: .normal)
        button.setTitle("", for: .normal)
    }
    @IBAction func clickedButton(_ sender: Any) {
        print("Clicked button")
        currentClicks += 1
        
        if(currentClicks == maxClicks){
            print("<<< Button")
            doneTask()
        }else{
            instructionLabel.text = String(maxClicks - currentClicks) + " more clicks"
        }
        
    }
}
