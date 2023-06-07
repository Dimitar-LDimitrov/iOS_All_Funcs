import UIKit

class BillCalculatorResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var resultString: String?
    var selectedTipPercentage: Double?
    var splitNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        totalLabel.text = resultString
        settingLabel.text = "Split between \(splitNumber!) people, with \(selectedTipPercentage! * 100)% tip."
    }
}
