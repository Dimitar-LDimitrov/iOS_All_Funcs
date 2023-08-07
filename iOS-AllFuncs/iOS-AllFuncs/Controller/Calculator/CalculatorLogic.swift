
import Foundation

struct CalculatorLogic {
    
    var number: Double?
    
    private var intermidiateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func calculate (action: String) -> Double? {
        
        if let n = number {
            switch action {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                self.intermidiateCalculation = (n1: n, calcMethod: action)
            }
        }
        return nil
    }
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermidiateCalculation?.n1,
            let operation = intermidiateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation does not exist.")
            }
        }
        return nil
    }
}
