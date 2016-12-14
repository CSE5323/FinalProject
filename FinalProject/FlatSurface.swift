import Foundation
import CoreMotion
import UIKit

class FlatSurface: Task {
    var motionManager = CMMotionManager()
    @IBOutlet var flatSurfaceLabel: UILabel!
    override func setupTask() {
        print("FlatSurface >>>")
        
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main){
            (data, error) in
            
//            print("X: " + String(describing: data?.acceleration.x) + " Y: " + String(describing: data?.acceleration.y) + "Z: " + String(describing: data?.acceleration.z))
            
            if let acceleration = data?.acceleration {
                //Facing down
                if(acceleration.x > 0 && acceleration.x < 0.04
                    && acceleration.y > 0 && acceleration.y < 0.04
                    && abs(acceleration.z + 1) < 0.01){
                    self.motionManager.stopAccelerometerUpdates()
                    print("<<< Flat surface")
                    self.doneTask()
                }
            }
            
        }
    }
}
