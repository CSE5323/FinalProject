import Foundation
import CoreMotion
import UIKit

class TurnLeft: Task {
    var motionManager = CMMotionManager()
    var turnedLeft = false
    var turnedBack = false
    @IBOutlet var flatSurfaceLabel: UILabel!
    override func setupTask() {
        
        turnedLeft = false
        turnedBack = false
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main){
            (data, error) in
            
            
            
            if let acceleration = data?.acceleration {
                if(-1.1 < acceleration.x && acceleration.x < -0.9 && !self.turnedLeft){
                    self.turnedLeft = true
                }
                if(-0.1 < acceleration.x && acceleration.x < 0.1 && self.turnedLeft){
                    self.turnedBack = true
                }
            }
            
            if(self.turnedLeft && self.turnedBack){
                self.motionManager.stopAccelerometerUpdates()
                self.doneTask()
            }
            
        }
    }
}
