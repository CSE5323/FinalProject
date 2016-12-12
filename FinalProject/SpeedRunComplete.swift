import UIKit

class SpeedRunComplete: UIViewController {
    @IBOutlet var totalTasksCompleted: UILabel!
    @IBOutlet var tasksRunTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TaskManager.endTime = NSDate()
        totalTasksCompleted.text = String(TaskManager.totalTasksDone)
        
        let timeInterval: Double = TaskManager.endTime.timeIntervalSince(TaskManager.startTime as Date).roundTo(places: 3);

        tasksRunTime.text = String(timeInterval) + " seconds"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

