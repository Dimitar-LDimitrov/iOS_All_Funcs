
import UIKit

class QuizzGameTwoViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var stories = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUi()
    }
    
    
    @IBAction func choiceMade(_ sender: UIButton) {
        
        stories.nextStory(userChoice: sender.titleLabel?.text)
        updateUi()
    }
    
    func updateUi() {
        titleLable.text = stories.getStoryTitle()
        choice1Button.setTitle(stories.getChoice1(), for: .normal)
        choice2Button.setTitle(stories.getChoice2(), for: .normal)
    }
}
