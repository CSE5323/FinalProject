import Foundation
import UIKit

class Swipe: Task {
    var maxSwipes = 0
    var randomDirections = [Int]()
    
    @IBOutlet var swipeLabel: UILabel!
    
    override func setupTask() {
        print("Swipe >>>")
        
        maxSwipes = randomInt(min: 1, max: 5)
        randomDirections.removeAll()
        
        for _ in 0  ..< maxSwipes {
            randomDirections.append(Int(arc4random_uniform(3)) + 1)
        }
        
        //Update instructions
        updateSwipeLabel()
        
        //up - 0
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        //right - 1
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        //down - 2
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        
        //left - 3
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    private func updateSwipeLabel(){
        var directionStrings = [String]()
        for i in 0  ..< randomDirections.count {
            
            switch randomDirections[i] {
                case 0:
                    directionStrings.append("up")
                case 1:
                    directionStrings.append("right")
                case 2:
                    directionStrings.append("down")
                case 3:
                    directionStrings.append("left")
                default:
                    break
            }
        }
        swipeLabel.text = "Swipe " + directionStrings.joined(separator: ",")
    }
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.right:
                    print("Swiped right")
                    if(randomDirections[0] == 1){
                        randomDirections.remove(at: 0)
                    }
                case UISwipeGestureRecognizerDirection.down:
                    print("Swiped down")
                    if(randomDirections[0] == 2){
                        randomDirections.remove(at: 0)
                    }
                case UISwipeGestureRecognizerDirection.left:
                    print("Swiped left")
                    if(randomDirections[0] == 3){
                        randomDirections.remove(at: 0)
                    }
                case UISwipeGestureRecognizerDirection.up:
                    print("Swiped up")
                    if(randomDirections[0] == 0){
                        randomDirections.remove(at: 0)
                    }
                default:
                    break
            }
        }
        if(randomDirections.count == 0){
            print("<<< Swipe")
            doneTask()
        }else{
            updateSwipeLabel()
        }
    }
}
