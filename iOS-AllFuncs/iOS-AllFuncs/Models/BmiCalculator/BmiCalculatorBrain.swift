import UIKit

struct BmiCalculatorBrain {
    
    var bmi: BMI?
    
    func getBmiValue() -> String? {
        
        return String(format: "%.1f", bmi?.value ?? "0.0")
    }
    
    mutating func calculateBmi(height: Float, weight: Float) {
        
        // bmi means Body Mass Index
        let bmiValue = (weight / (height * height))
        
        switch bmiValue {
        case 0..<18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more sweets", color: .cyan)
            break
        case 18.5...24.9:
            bmi = BMI(value: bmiValue, advice: "It is normal", color: .darkGray)
            break
        case 24.9...100:
            bmi = BMI(value: bmiValue, advice: "You are Fat!", color: .red)
            break
        default:
            break
        }
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
}
