//
//  DiamondViewController.swift
//  iOS-AllFuncs
//
//  Created by Dimitar Dimitrov on 11.05.23.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var diceGameButton: UIButton!
    @IBOutlet weak var diceVCButton: UIButton!
    @IBOutlet weak var eightBallButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        diceGameButton.layer.cornerRadius = 5
        eightBallButton.layer.cornerRadius = 5
    }
    
}
