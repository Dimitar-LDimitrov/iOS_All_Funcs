//
//  DiamondViewController.swift
//  iOS-AllFuncs
//
//  Created by Dimitar Dimitrov on 11.05.23.
//

import UIKit

class DiamondViewController: UIViewController {

    @IBOutlet weak var diceGameButton: UIButton!
    
    @IBOutlet weak var diceVCButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        print("DiamondViewController -> viewDidLoad")
        diceGameButton.layer.cornerRadius = 5
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
