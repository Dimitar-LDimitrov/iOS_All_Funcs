import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        navigationItem.title = "⚡️FlashChat"
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            
            // I create segue to show FlashChatViewController when this button is pressed
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
