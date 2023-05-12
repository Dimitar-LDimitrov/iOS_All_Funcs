//
//  DiceViewController.swift
//  iOS-AllFuncs
//
//  Created by Dimitar Dimitrov on 11.05.23.
//

import UIKit

class DiceViewController: UIViewController {

    @IBOutlet weak var greenBackgroundIV: UIImageView!
    @IBOutlet weak var diceTwo: UIImageView!
    @IBOutlet weak var diceOne: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        diceTwo.image = UIImage(named: "DiceSix")
        diceOne.alpha = 0.5
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("Roll button tapped")
        
        let diceOneRand = Int.random(in: 1..<7)
        let diceTwoRand = Int.random(in: 1..<7)
        
        intToImageTransaction(randomNumber: diceOneRand, dice: diceOne)
        intToImageTransaction(randomNumber: diceTwoRand, dice: diceTwo)
    }
    
    @objc func intToImageTransaction(randomNumber: Int, dice: UIImageView){

        switch randomNumber {
        
        case 1:
            dice.image = UIImage(named: "DiceOne")

        case 2:
            dice.image = UIImage(named: "DiceTwo")
            
        case 3:
            dice.image = UIImage(named: "DiceThree")

        case 4:
            dice.image = UIImage(named: "DiceFour")

        case 5:
            dice.image = UIImage(named: "DiceFive")
            
        case 6:
            dice.image = UIImage(named: "DiceSix")

        default:
            print("Nope! Error")
        }
    }
}
