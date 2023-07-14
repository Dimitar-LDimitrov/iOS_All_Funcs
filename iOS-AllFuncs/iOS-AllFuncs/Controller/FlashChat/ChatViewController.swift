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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = messages[indexPath.row].body
        
        return cell
    }
}

// just to practice delegates print to console the number of selected row
extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
