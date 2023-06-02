
import UIKit

class BmiCalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSLider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var bmiCalculator = BmiCalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        heightLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        weightLabel.text = String(format: "%.0f", sender.value) + "Kg"
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        bmiCalculator.calculateBmi(height: heightSLider.value, weight: weightSlider.value)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultBMIViewController
            resultVC.bmiValue = bmiCalculator.getBmiValue()
            resultVC.advice = bmiCalculator.getAdvice()
            resultVC.color = bmiCalculator.getColor()
        }
    }
}
