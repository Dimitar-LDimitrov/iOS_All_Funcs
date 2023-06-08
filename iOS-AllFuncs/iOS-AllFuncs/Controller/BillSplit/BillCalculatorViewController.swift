import UIKit

class BillCalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var selectedTipPercentage = 0.1
    var splitNumber = 2
    var finalResult = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        if sender.titleLabel?.text == "0%"{
            zeroPercentButton.isSelected = true
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = false
            selectedTipPercentage = 0.0
        } else if sender.titleLabel?.text == "10%" {
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = true
            twentyPercentButton.isSelected = false
            selectedTipPercentage = 0.1
        } else if sender.titleLabel?.text == "20%" {
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = true
            selectedTipPercentage = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(Int(sender.value))
        splitNumber = Int(sender.value)
    }
    //125.50
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        var billTextToDouble = Double(billTextField.text!)
        var result = billTextToDouble! / Double(splitNumber)
        finalResult = result + result * selectedTipPercentage
        
        performSegue(withIdentifier: "showResultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultSegue" {
            if let destinationVC = segue.destination as? BillCalculatorResultViewController {
                
                destinationVC.resultString = String(finalResult)
                destinationVC.selectedTipPercentage = Double(selectedTipPercentage)
                destinationVC.splitNumber = splitNumber
            }
        }
    }
}
