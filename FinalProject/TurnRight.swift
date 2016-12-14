import Foundation
import CoreMotion
import UIKit

class TurnRight: Task {
    var motionManager = CMMotionManager()
    @IBOutlet var flatSurfaceLabel: UILabel!
    override func setupTask() {
        print("TurnRight >>>")
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main){
            (data, error) in
            
            
            
            if let acceleration = data?.acceleration {
                if(0.8 < acceleration.x && acceleration.x < 1.2){
                    self.motionManager.stopAccelerometerUpdates()
                    print("<<< TurnRight")
                    self.doneTask()
                }
            }
            
        }
    }
}
