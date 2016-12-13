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
    
        let randomIndex = Int(arc4random_uniform(UInt32(TaskManager.taskNames.count)))
//        let randomIndex = 0
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: TaskManager.taskNames[randomIndex])
        self.present(controller, animated: true, completion: nil)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func presentController(controllerName : String){
        let nav = UINavigationController(rootViewController: NSObject.fromClassName(className: controllerName) as! UIViewController )
        nav.navigationBar.isTranslucent = false
        self.navigationController?.present(nav, animated: true, completion: nil)
    }
    @IBAction func startCountTasks(_ sender: Any) {
        TaskManager.runMode = "count"
        self.startRun()
    }
    @IBAction func startTimeTasks(_ sender: Any) {
//        TaskManager.runMode = "time"
//        self.startRun()
    }
    func startRun(){
        TaskManager.totalTasksDone = 0
        TaskManager.startTime = NSDate()
        self.newTask()
    }


}

