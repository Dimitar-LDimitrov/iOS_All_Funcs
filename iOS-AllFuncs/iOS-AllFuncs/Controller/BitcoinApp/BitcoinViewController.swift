
import UIKit

class BitcoinViewController: UIViewController {
    
    @IBOutlet weak var bitcoinLabelText: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var bitcoinManagerInstanse = BitcoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bitcoinManagerInstanse.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension BitcoinViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // how many columns the pickerView will have
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bitcoinManagerInstanse.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bitcoinManagerInstanse.currencyArray[row]
    }
    
    // This will get called every time when the user scrolls the picker
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrencyRow = bitcoinManagerInstanse.currencyArray[row]
        bitcoinManagerInstanse.getCoinPrice(for: selectedCurrencyRow)
    }
}

// MARK: - BitcoinManagerDelegate
extension BitcoinViewController: BitcoinManagerDelegate {
    
    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.bitcoinLabelText.text = price
            self.currencyLabel.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
