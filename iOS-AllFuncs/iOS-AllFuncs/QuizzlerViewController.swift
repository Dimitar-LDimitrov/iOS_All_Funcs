
import UIKit

class QuizzlerViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quiz = [[String]]()
    var showedQuestions = Set<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var arr = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        print(arr[2][2])
 
        quiz = [
           ["A slug's blood is green.", "True"],
           ["Approximately one quarter of human bones are in the feet.", "True"],
           ["The total surface area of two human lungs is approximately 70 square metres.", "True"],
           ["In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take], it home to eat.", "True"],
           ["In London, UK, if you happen to die in the House of Parliament, you are technically entitled], to a state funeral, because the building is considered too sacred a place.", "False"],
           ["It is illegal to pee in the Ocean in Portugal.", "True"],
           ["You can lead a cow down stairs but not up stairs.", "False"],
           ["Google was originally called 'Backrub'.", "True"],
           ["Buzz Aldrin's mother's maiden name was 'Moon'.", "True"],
           ["The loudest sound produced by any animal is 188 decibels. That animal is the African], Elephant.", "False"],
           ["No piece of square dry paper can be folded in half more than 7 times.", "False"],
           ["Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small], dog.", "True"],
        ]
        
    }

    @IBAction func answerGiven(_ sender: UIButton) {
        
        var positionOfQuestion = Int.random(in: 0..<quiz.count)
        var userAnswer = sender.titleLabel?.text
        var questionAnswer = quiz[positionOfQuestion][1]
        
        if  userAnswer == questionAnswer {
            label.text = "Correct!"
        } else {
            label.text = "Wrong"
        }
        
        questionText.text = quiz[positionOfQuestion][0]
        
        showedQuestions.insert(positionOfQuestion)
    }
}
