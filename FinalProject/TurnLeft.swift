import Foundation
import CoreMotion
import UIKit

class TurnLeft: Task {
    var motionManager = CMMotionManager()
    @IBOutlet var flatSurfaceLabel: UILabel!
    override func setupTask() {
        print("TurnLeft  >>>")
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main){
            (data, error) in
            
            if let acceleration = data?.acceleration {
                if(-1.2 < acceleration.x && acceleration.x < -0.8){
                    self.motionManager.stopAccelerometerUpdates()
                    print("<<< TurnLeft")
                    self.doneTask()
                }
            }
            
        }
    }
}
