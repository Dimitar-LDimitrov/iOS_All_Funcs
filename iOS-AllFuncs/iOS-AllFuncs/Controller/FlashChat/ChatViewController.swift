import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
    }
    
    
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        //  do {
        //      try Auth.auth().signOut()
        //
        //      let flashChatVC = FlashChatViewController()
        //      let navigationController = UINavigationController(rootViewController: //flashChatVC)
        //      self.present(navigationController, animated: true, completion: nil)
        //
        //
        //  } catch let signOutError as NSError {
        //    print("Error signing out: %@", signOutError)
        //  }
    }
    
}
