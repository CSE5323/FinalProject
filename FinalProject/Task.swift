import Foundation
import UIKit

class Task: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTask()
    }
    
    func setupTask() {
        print("Task >>>")
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
//        print("<<< Task")
    }
    func doneRun(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SpeedRunComplete")
        self.present(controller, animated: true, completion: nil)
    }
}
