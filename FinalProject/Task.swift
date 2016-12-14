import Foundation
import UIKit

class Task: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTask()
    }
    
    func setupTask() {
    }
    
    func doneTask() {
        TaskManager.totalTasksDone += 1
        if(TaskManager.runMode == "all" && TaskManager.totalTasksDone == TaskManager.taskNames.count){
            doneRun()
        }else if(TaskManager.runMode == "random" && TaskManager.totalTasksDone == TaskManager.randomModeMaxTasks){
            doneRun()
        }else{
            self.newTask()
        }
    }
    func doneRun(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SpeedRunComplete")
        self.present(controller, animated: false, completion: nil)
    }
}
