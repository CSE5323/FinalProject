//
//  MenuController.swift
//  FinalProject
//
//  Created by Jenn Le on 11/22/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import UIKit
extension UIViewController {
    func newTask() {
        
        var taskName: String
        if(TaskManager.runMode == "random"){
            let randomIndex = randomInt(min: 0, max: TaskManager.taskNames.count - 1)
            taskName = TaskManager.taskNames[randomIndex]
        }else{
            print("Total tasks done: " + String(TaskManager.totalTasksDone))
            taskName = TaskManager.taskNames[TaskManager.totalTasksDone]
        }
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: taskName)
        self.present(controller, animated: false, completion: nil)
    }
}

extension NSObject {
    class func fromClassName(className : String) -> NSObject {
        let className = Bundle.main.infoDictionary!["CFBundleName"] as! String + "." + className
        let aClass = NSClassFromString(className) as! UIViewController.Type
        return aClass.init()
    }
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
}
extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

class MenuController: UIViewController {
    @IBOutlet var randomTasksLabel: UILabel!
    @IBOutlet var allXTasksLabel: UILabel!
    @IBOutlet var moveTasksButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updatedSettings()
    }

    func updatedSettings(){
        TaskManager.setup()
        randomTasksLabel.text = String(TaskManager.randomModeMaxTasks) + " random tasks"
        allXTasksLabel.text = "All " + String(TaskManager.taskNames.count) + " tasks"
        moveTasksButton.setTitle(TaskManager.canDoMoveTasks ? "Move Tasks Enabled" : "Move Tasks Disabled", for: UIControlState.normal)
        if(TaskManager.testMode){
            moveTasksButton.isHidden = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startRandomTasks(_ sender: Any) {
        TaskManager.runMode = "random"
        self.startRun()
    }
    @IBAction func startXTasks(_ sender: Any) {
        TaskManager.runMode = "all"
        self.startRun()
    }
    @IBAction func moveButtonClicked(_ sender: UIButton) {
        TaskManager.canDoMoveTasks = !TaskManager.canDoMoveTasks
        updatedSettings()
    }
    func startRun(){
        TaskManager.totalTasksDone = 0
        TaskManager.startTime = NSDate()
        self.newTask()
    }


}

