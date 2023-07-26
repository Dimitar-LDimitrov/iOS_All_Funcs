//
//  ToDoViewController.swift
//  iOS-AllFuncs
//
//  Created by Dimitar Dimitrov on 25.07.23.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var itemArray = [ "Legolas", "Aragorn", "Gimlys"]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Here we connect itemArray data with phone/simulator persistant data
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            itemArray = items
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    // when the cell is pressed
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(itemArray[indexPath.row])
        
        // that give you reference to the selected cell
        // tableView.cellForRow(at: indexPath)
        
        // deselect and select checkmark in cell
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // deselect checkmark
        
        // deselect cell when the cell is pressed
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        // the title of alert
        let alert = UIAlertController(title: "Add new ToDo item", message: "", preferredStyle: .alert)
        
        // what will happend when the user pressed "Add Item" btn on our UIAlert
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in

            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        alert.addTextField() { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
