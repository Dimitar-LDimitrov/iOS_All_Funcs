//
//  ToDoViewController.swift
//  iOS-AllFuncs
//
//  Created by Dimitar Dimitrov on 25.07.23.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var itemArray = [ToDoItemCell]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toDoItem1 = ToDoItemCell()
        toDoItem1.title = "Sam"
        itemArray.append(toDoItem1)
        
        let toDoItem2 = ToDoItemCell()
        toDoItem2.title = "Pipin"
        itemArray.append(toDoItem2)
        
        // Here we connect itemArray data with phone/simulator persistant data
       // if let items = defaults.array(forKey: "ToDoListArray") as? [ToDoItemCell] {
       //     itemArray = items
       // }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        return cell
    }
    
    // when the cell is pressed
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // that give you reference to the selected cell
        // tableView.cellForRow(at: indexPath)
        
        // deselect and select checkmark in cell
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            itemArray[indexPath.row].isChecked = false
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            itemArray[indexPath.row].isChecked = true
        }
    }
    
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        // the title of alert
        let alert = UIAlertController(title: "Add new ToDo item", message: "", preferredStyle: .alert)
        
        // what will happend when the user pressed "Add Item" btn on our UIAlert
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newCell = ToDoItemCell()
            newCell.title = textField.text!
            self.itemArray.append(newCell)
            
            // this is for setting UserDefaults, but we are gonna use FileManager
            // self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            let encoder = PropertyListEncoder()
            
            do {
                let data = try encoder.encode(self.itemArray)
                try data.write(to: self.dataFilePath!)
            } catch {
                print("Error encoding item array, \(error)")
            }
            
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
