//
//  FlashChatViewController.swift
//  iOS-AllFuncs
//
//  Created by Dimitar Dimitrov on 28.06.23.
//

import UIKit

class FlashChatViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLetters = titleLabel.text
        var charIndex = 0.0
        titleLabel.text = ""
        if let titleText = titleLetters {
            for letter in titleText {
                
                Timer.scheduledTimer(withTimeInterval: 0.13 * charIndex, repeats: false) { (timer) in
                    self.titleLabel.text?.append(letter)
                }
                charIndex += 1
            }
        }
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
