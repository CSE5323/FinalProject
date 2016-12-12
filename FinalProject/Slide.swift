import Foundation
import UIKit

class Slide: Task {
    @IBOutlet var slide: UISlider!
    
    override func setupTask() {
    }
    @IBAction func slideChanged(_ sender: UISlider) {
        if(sender.value == 1){
            doneTask()
        }
    }
}
