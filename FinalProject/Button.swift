import Foundation
import UIKit

class Button: Task {
    var maxClicks = 0
    var currentClicks = 0
    @IBOutlet var button: UIButton!
    @IBOutlet weak var instruction: UILabel!
    
    
    override func setupTask() {
        maxClicks = randomInt(min: 1, max: 5)
        instruction.text = "Click me " + String(maxClicks) + " times"
    }
    @IBAction func clickedButton(_ sender: Any) {
        currentClicks += 1
        
        if(currentClicks == maxClicks){
            doneTask()
        }else{
            instruction.text = String(maxClicks - currentClicks) + " more clicks"
        }
        
    }
}
