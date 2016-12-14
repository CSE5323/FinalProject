import UIKit
import AVFoundation

class HandOverCamera: Task   {
    
    //MARK: Class Properties
    var filters : [CIFilter]! = nil
    var videoManager:VideoAnalgesic! = nil
    let pinchFilterIndex = 2
    var detector:CIDetector! = nil
    let bridge = OpenCVBridge()
    
    //MARK: Outlets in view
    @IBOutlet weak var stageLabel: UILabel!
    @IBOutlet weak var toggleCameraButton: UIButton!
    var isDone = false
    
    //MARK: ViewController Hierarchy
    override func setupTask() {
        print("HandOverCamera >>>")
        
        isDone = false
        self.view.backgroundColor = nil
        
        self.videoManager = VideoAnalgesic.sharedInstance
        self.videoManager.setCameraPosition(AVCaptureDevicePosition.back)
        
        self.videoManager.setProcessingBlock(self.processImage)
        
        if !videoManager.isRunning{
            videoManager.start()
        }
        
    }
    
    //MARK: Process image output
    func processImage(_ inputImage:CIImage) -> CIImage{
        print("processImage")
        
        
        var retImage = inputImage
        
        //HINT: you can also send in the bounds of the face to ONLY process the face in OpenCV
        // or any bounds to only process a certain bounding region in OpenCV
        self.bridge.setTransforms(self.videoManager.transform)
        self.bridge.setImage(retImage, withBounds: retImage.extent, andContext: self.videoManager.getCIContext())
        
        let hasPalm = self.bridge.processImage()
        retImage = self.bridge.getImageComposite() // get back opencv processed part of the image (overlayed on original)
        
        if(hasPalm && !isDone){
            isDone = true
            DispatchQueue.global(qos: .background).async {
                self.videoManager.shutdown()
                self.videoManager = nil
            }
            
            DispatchQueue.main.async {
                print("<<< HandOverCamera")
                self.doneTask()
            }
            
        }
        
        return retImage
    }
    
    
}

