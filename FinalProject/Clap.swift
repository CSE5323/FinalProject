import UIKit
import AudioKit

class Clap: Task {
    
    @IBOutlet var amplitudeLabel: UILabel!
    @IBOutlet var audioInputPlot: EZAudioPlot!
    @IBOutlet var instructionLabel: UILabel!
    
    var mic: AKMicrophone!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    var maxClaps = 5
    var currentClapsDone = 0
    
    func setupPlot() {
        let plot = AKNodeOutputPlot(mic, frame: audioInputPlot.bounds)
        plot.plotType = .rolling
        plot.shouldFill = true
        plot.shouldMirror = true
        plot.color = UIColor.blue
        audioInputPlot.addSubview(plot)
    }
    
    override func setupTask() {
        print("Clap  >>>")
        currentClapsDone = 0
        maxClaps = randomInt(min: 1,max: 5)
        AKSettings.audioInputEnabled = true
        mic = AKMicrophone()
        tracker = AKFrequencyTracker.init(mic)
        silence = AKBooster(tracker, gain: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AudioKit.output = silence
        AudioKit.start()
        setupPlot()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(Clap.updateUI), userInfo: nil, repeats: true)
    }
    
    func updateUI() {
        if(tracker.amplitude > 0.15){
            currentClapsDone += 1
        }
        
        if(currentClapsDone == maxClaps){
            AudioKit.stop()
            print("<<< Clap")
            doneTask()
        }
        
        if(maxClaps - currentClapsDone >= 0){
           instructionLabel.text = "Clap " + String(maxClaps - currentClapsDone) + " times"
        }
        
    }
}

