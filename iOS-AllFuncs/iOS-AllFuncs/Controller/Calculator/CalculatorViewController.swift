import UIKit

class CalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumbers = true
    
    @IBAction func calculateBtnPressed(_ sender: UIButton) {
        
        guard let currentValue = Double(displayLabel.text!) else {
            fatalError("Cannot convert displayLabel.text into double.")
        }
        
        if let calcMethod = sender.currentTitle {
            
            if calcMethod == "+/-" {
                displayLabel.text = String(currentValue * -1)
                
            } else if calcMethod == "AC" {
                
                isFinishedTypingNumbers = true
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(currentValue / 100)
            }
        }
    }
    
    @IBAction func numberBtnPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumbers {
                displayLabel.text = numValue
                isFinishedTypingNumbers = false
            } else {
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
