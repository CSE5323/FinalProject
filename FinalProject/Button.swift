import Foundation
import UIKit

class Button: Task {
    var maxClicks = 0
    var currentClicks = 0
    @IBOutlet var button: UIButton!
    
    
    override func setupTask() {
        maxClicks = Int(arc4random_uniform(5)) + 1
        button.setTitle("Click me " + String(maxClicks) + " times", for: .normal)
    }
    @IBAction func clickedButton(_ sender: Any) {
        currentClicks += 1
        
        if(currentClicks == maxClicks){
            doneTask()
        }else{
            button.setTitle(String(maxClicks - currentClicks) + " more clicks", for: .normal)
        }
        
    }
}
