
import UIKit

class EightBallViewController: UIViewController {
    @IBOutlet weak var backNavButton: UINavigationItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func askButtonTapped(_ sender: UIButton) {
        
        
        let ballsArray = [UIImage(named: "ball1"),UIImage(named: "ball2"),UIImage(named: "ball3"),UIImage(named: "ball4"),UIImage(named: "ball5")]
        
        imageView.image = ballsArray.randomElement() as! UIImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UINavigationBar.appearance().tintColor = .purple
    }
}
