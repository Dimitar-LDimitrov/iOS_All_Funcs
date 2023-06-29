//
//  FlashChatViewController.swift
//  iOS-AllFuncs
//
//  Created by Dimitar Dimitrov on 28.06.23.
//

import UIKit
import CLTypingLabel

class FlashChatViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "⚡️FlashChat"
    }
}
