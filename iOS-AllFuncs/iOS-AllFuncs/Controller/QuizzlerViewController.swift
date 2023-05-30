
import UIKit

class QuizzlerViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var choiceOne: UIButton!
    
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    
    var quizzData = QuizzData()
    
    var quiz: [Question] = []
    var positionOfQuestion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0.0
        updateUI()
    }
    
    @IBAction func answerGiven(_ sender: UIButton) {
        
        let userAnswer = sender.titleLabel?.text ?? ""
        
        let userGotItRight = quizzData.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            label.text = "Correct! Score: \(quizzData.getScore())"
            sender.backgroundColor = UIColor.green
        } else {
            label.text = "Wrong! Score: \(quizzData.getScore())"
            sender.backgroundColor = UIColor.red
        }
        
        quizzData.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        
        questionText.text = quizzData.getQuestionText()
        
        let answerChoices = quizzData.getAnswers()
        choiceOne.setTitle(answerChoices[0], for: .normal)
        choiceTwo.setTitle(answerChoices[1], for: .normal)
        choiceThree.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizzData.getProgress()
        label.text = "Score: \(quizzData.getScore())"
        
        choiceOne.backgroundColor = UIColor.clear
        choiceTwo.backgroundColor = UIColor.clear
        choiceThree.backgroundColor = UIColor.clear
    }
}
