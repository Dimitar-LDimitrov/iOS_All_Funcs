import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.hidesBackButton = true
        navigationItem.title = "⚡️FlashChat"
        
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        loadMessages()
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        
        if let message = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            
            // add data to Firebase db
            db.collection(Constants.FStore.collectionName).addDocument(
                data:[
                    "sender": messageSender,
                    "body": message,
                    "date": Date().timeIntervalSince1970]) // gives you time in second since 1970
            { (error) in
                if let e = error {
                    print("There was an issue saving data to firestore, \(e.localizedDescription)")
                } else {
                    print("Successfully saved data.")
                    
                    // because of UI change is good to call DispatchQueue
                    DispatchQueue.main.async {
                        // message get deleted after send button is pressed
                        self.messageTextField.text = ""
                    }
                }
            }
        }
    }
    
    // load data from Firestore
    func loadMessages() {
        
        // calling Firebase firestore to get all documents with .getDocuments method, but we
        // need to setClickListener becouse we have message app and want to update UI offen
        db.collection("messages")
            .order(by: "date") 
            .addSnapshotListener { querySnapshot, error in
            self.messages = []
            if let e = error {
                print("There is an issue retrieving data from Firestore. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for document in snapshotDocuments {
                        let data = document.data()
                        if let messageSender = data[Constants.FStore.sender] as? String, let messageBody = data["body"] as? String {
                            
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            
                            self.messages.append(newMessage)
                            
                            // Is good practice when you change UI data to call DispatchQueue
                            DispatchQueue.main.async {
                                
                                self.tableView.reloadData()
                                
                                // here we want to scroll to the bottom of chat when new message is added
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top
                                                           , animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            
            // I create segue to show FlashChatViewconstantroller when this button is pressed
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        // This is a message from current user
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: Constants.BrandColors.purple)
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.purple)
            cell.label.textColor = UIColor(named: Constants.BrandColors.lightPurple)
        }
        
        return cell
    }
}

// just to practice delegates print to console the number of selected row
extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
