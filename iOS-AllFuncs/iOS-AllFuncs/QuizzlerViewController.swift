
import UIKit

class QuizzlerViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quiz = [String]()
    var showedQuestions = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quiz = [
            "A slug's blood is green.",
            "Approximately one quarter of human bones are in the feet.",
            "The total surface area of two human lungs is approximately 70 square metres.",
            "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.",
            "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.",
            "It is illegal to pee in the Ocean in Portugal.",
            "You can lead a cow down stairs but not up stairs.",
            "Google was originally called 'Backrub'.",
            "Buzz Aldrin's mother's maiden name was 'Moon'.",
            "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.",
            "No piece of square dry paper can be folded in half more than 7 times.",
            "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog."
        ]
        
    }

    @IBAction func answerGiven(_ sender: UIButton) {
        
        var positionOfQuestion = Int.random(in: 0..<quiz.count)
        
        if showedQuestions.contains(positionOfQuestion) == false {
            questionText.text = quiz[positionOfQuestion]
        } else {
            // да се направи логика, ако текущия въпрос вече е показван как
            // със сигурност да се покаже такъв какъвто не е показван досега
        }
        
        showedQuestions.append(positionOfQuestion)
    }
}

struct Question {
    
}
