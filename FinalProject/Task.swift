import Foundation
import UIKit

class Task: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTask()
    }
    
    func setupTask() {
        
    }
    
    func doneTask() {
        TaskManager.totalTasksDone += 1
        if(TaskManager.totalTasksDone == TaskManager.countModeMaxTasks && TaskManager.runMode == "count"){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "SpeedRunComplete")
            self.present(controller, animated: true, completion: nil)
        }else{
            self.newTask()
        }
    }
}
