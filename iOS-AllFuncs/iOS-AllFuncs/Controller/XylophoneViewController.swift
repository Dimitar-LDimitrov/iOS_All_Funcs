
import UIKit
import AVFoundation

class XylophoneViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func keyPressed(_ sender: UIButton) {
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            
            sender.alpha = 1
        }
        playSound(currTitle: sender.titleLabel?.text)
    }
    
    func playSound(currTitle: String?){
        
        let url: URL? = Bundle.main.url(forResource: currTitle, withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
        }
        
        audioPlayer?.play()
    }
}
