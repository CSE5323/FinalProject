import Foundation
import UIKit

class Slide: Task {
    @IBOutlet var slide: UISlider!
    
    override func setupTask() {
        print("Slide >>>")
        
        slide.value = 0
    }
    @IBAction func slideChanged(_ sender: UISlider) {
        if(sender.value == 1){
            print("<<< Slide")
            doneTask()
        }
    }
}
