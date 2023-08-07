import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumbers: Bool = true
    
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
    
    var calculatorLogic = CalculatorLogic()
    
    @IBAction func calculateBtnPressed(_ sender: UIButton) {
        
        isFinishedTypingNumbers = true
        
        if let calcMethod = sender.currentTitle {
            
            
            calculatorLogic.setNumber(displayValue)
            
            if let result = calculatorLogic.calculate(action: calcMethod) {
                displayValue = result
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
