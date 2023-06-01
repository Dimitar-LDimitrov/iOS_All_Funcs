
import UIKit

class BmiCalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSLider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
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
        
        // bmi means Body Mass Index
        var bmi = String(format: "%.2f", (weightSlider.value / sqrt(heightSLider.value)))
        var bmi2 = String(format: "%.2f", (weightSlider.value / pow(heightSLider.value, 2)))
        print(bmi)
        print(bmi2)
    }
}
