//
//  FindAFriend.swift
//  FinalProject
//
//  Created by Jenn Le on 12/13/16.
//  Copyright © 2016 Thakugan. All rights reserved.
//

import Foundation
import AVFoundation

class FindAFriend: Task {
    
    @IBOutlet weak var cameraView: UIView!
    var videoManager:VideoAnalgesic! = nil
    var detector:CIDetector! = nil
    
    var isDone = false
    
    //MARK: ViewController Hierarchy
    override func setupTask() {
        DispatchQueue.main.async {
            print("FindAFriend >>>")
            
            self.view.backgroundColor = nil
            self.cameraView.backgroundColor = nil
            
            self.isDone = false
            
            self.videoManager = VideoAnalgesic.sharedInstance
            self.videoManager.setCameraPosition(AVCaptureDevicePosition.back)
            
            // create dictionary for face detection
            // HINT: you need to manipulate these proerties for better face detection efficiency
            let optsDetector = [CIDetectorAccuracy:CIDetectorAccuracyHigh]
            
            // setup a face detector in swift
            self.detector = CIDetector(ofType: CIDetectorTypeFace,
                                       context: self.videoManager.getCIContext(), // perform on the GPU is possible
                options: optsDetector)
            
            self.videoManager.setProcessingBlock(self.processImage)
            
            if !self.videoManager.isRunning{
                self.videoManager.start()
            }
        }
        
        
    }
    
    func getFaces(img:CIImage) -> [CIFaceFeature]{
        // this ungodly mess makes sure the image is the correct orientation
        let optsFace = [CIDetectorImageOrientation:self.videoManager.ciOrientation]
        // get Face Features
        return self.detector.features(in: img, options: optsFace) as! [CIFaceFeature]
        
    }
    
    //MARK: Process image output
    func processImage(inputImage:CIImage) -> CIImage{
        
        // detect faces
        let f = getFaces(img: inputImage)
        
        // if no faces, just return original image
        if f.count == 0 { return inputImage }
        
        //otherwise apply the filters to the faces
        if(self.videoManager.isRunning && !isDone){
            isDone = true
            DispatchQueue.main.async {
                print("videoManager shutdown")
                self.videoManager.shutdown()
                self.videoManager = nil
            }
            
        }
        DispatchQueue.main.async {
            print("<<< FindAFriend")
            self.doneTask()
        }
        
        return inputImage
    }
}
