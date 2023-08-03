import UIKit

class CalculatorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumbers = true
    
    private var displayValue: Double {
        get {
            guard let currentValue = Double(displayLabel.text!) else {
                fatalError("Cannot convert displayLabel.text into double.")
            }
            return currentValue
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calculateBtnPressed(_ sender: UIButton) {
        
        if let calcMethod = sender.currentTitle {
            
            if calcMethod == "+/-" {
                displayValue *= -1
                
            } else if calcMethod == "AC" {
                
                isFinishedTypingNumbers = true
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayValue *= 0.01
            }
        }
    }
    
    @IBAction func numberBtnPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumbers {
                displayLabel.text = numValue
                isFinishedTypingNumbers = false
            } else {
                // check is the '.' is pressed second time
                if numValue == "." {
                    if (displayLabel.text!.contains(".")) {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
