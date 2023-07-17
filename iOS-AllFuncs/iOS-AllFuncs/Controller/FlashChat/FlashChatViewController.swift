//
//  FlashChatViewController.swift
//  iOS-AllFuncs
//
//  Created by Dimitar Dimitrov on 28.06.23.
//

import UIKit
import CLTypingLabel

class FlashChatViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = Constants.flashChatTitle
        
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.13 * charIndex, repeats: false) {_ in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
        // create custom back button
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonPressed))
        
        // Set the custom back button as the left bar button item
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonPressed() {
        // Get a reference to the target view controller
        guard let targetViewController = navigationController?.viewControllers.first(where: { $0 is DashboardViewController }) else {
            return
        }
        
        // Pop to the target view controller
        navigationController?.popToViewController(targetViewController, animated: true)
    }
}


