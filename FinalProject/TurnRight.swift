import Foundation
import CoreMotion
import UIKit

class TurnRight: Task {
    var motionManager = CMMotionManager()
    var turnedRight = false
    var turnedBack = false
    @IBOutlet var flatSurfaceLabel: UILabel!
    override func setupTask() {
        
        turnedRight = false
        turnedBack = false
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main){
            (data, error) in
            
            
            
            if let acceleration = data?.acceleration {
                if(0.9 < acceleration.x && acceleration.x < 1.1 && !self.turnedRight){
                    self.turnedRight = true
                }
                if(-0.1 < acceleration.x && acceleration.x < 0.1 && self.turnedRight){
                    self.turnedBack = true
                }
            }
            
            if(self.turnedRight && self.turnedBack){
                self.motionManager.stopAccelerometerUpdates()
                self.doneTask()
            }
            
        }
    }
}
