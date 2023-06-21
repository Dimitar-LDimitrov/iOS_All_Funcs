import UIKit

class ClimaViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a delegate for searchTextField
        searchTextField.delegate = self
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        // remove keyboard when search is pressed
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    // enable return button on keyboard to be active when is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Can`t be empty"
            return false
        }
    }
    
    // remove already typed City when pressed search/return button
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}
