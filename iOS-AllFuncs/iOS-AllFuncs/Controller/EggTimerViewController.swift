
import UIKit
import AVFAudio

class EggTimerViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var proggresBar: UIProgressView!
    
    var player: AVAudioPlayer?
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    let eggTimess = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func eggPressed(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.titleLabel?.text
        totalTime = eggTimess[hardness!]!
      
        proggresBar.progress = 0.0
        secondsPassed = 0
        label.text = hardness
      
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter(){
        if secondsPassed < totalTime{
        secondsPassed += 1
        let percentageProgress = Float(secondsPassed) / Float(totalTime)
        proggresBar.progress = Float(percentageProgress)
        } else{
            timer.invalidate()
            label.text = "DONE!"
            playSound()
        }
    }
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
