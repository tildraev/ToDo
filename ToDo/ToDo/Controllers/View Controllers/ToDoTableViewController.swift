//
//  ToDoTableViewController.swift
//  ToDo
//
//  Created by Arian Mohajer on 1/27/22.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    
    // MARK: - IBOutlets
    
    
    @IBOutlet weak var newToDoItemNameLabel: UITextField!
    @IBOutlet weak var addToDoButton: UIButton!
    
    var toDoGroup: ToDoGroup? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numOfRows = toDoGroup?.toDoList.count {
            return numOfRows
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as? ToDoTableViewCell else { return UITableViewCell() }
        
        // Configure the cell...
        if let toDoItem = toDoGroup?.toDoList[indexPath.row] {
            cell.toDoItemNameLabel.text = toDoItem.name
            
            let isCompletedButtonImageString = toDoItem.isComplete ? "checkmark.square.fill" : "checkmark.square"
            let isCompletedButtonImage = UIImage(systemName: isCompletedButtonImageString)
            cell.toDoItemIsCompleteButton.setImage(isCompletedButtonImage, for: .normal)
        }
        
        cell.delegate = self
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if let toDoGroup = toDoGroup {
                let toDoItem = toDoGroup.toDoList[indexPath.row]
                ToDoGroupController.sharedInstance.deleteToDoItem(group: toDoGroup, toDo: toDoItem)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func addToDoButtonTapped(_ sender: Any) {
        guard let toDoGroup = toDoGroup,
              let newToDoName = newToDoItemNameLabel.text, !newToDoName.isEmpty else { return }
        ToDoGroupController.sharedInstance.createToDoItem(group: toDoGroup, name: newToDoName)
        tableView.reloadData()
    }
    
    func presentAllDoneAlertController() {
        let alertController = UIAlertController(title: "All Done!", message: "Want us to delete this list?", preferredStyle: .alert)
        
        let noAction = UIAlertAction(title: "No", style: .default)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
            guard let toDoGroup = self.toDoGroup else { return }
            ToDoGroupController.sharedInstance.deleteToDoGroup(toDoGroup: toDoGroup)
            self.navigationController?.popViewController(animated: true)
        }
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension ToDoTableViewController: ToDoTableViewCellDelegate {
    func deleteToDoGroupIfAllItemsComplete(cell: ToDoTableViewCell) {
        guard let toDoGroup = toDoGroup else { return }
        
        var incompleteItemCount = 0
        
        toDoGroup.toDoList.forEach { toDoItem in
            if !toDoItem.isComplete {
                incompleteItemCount += 1
            }
        }
        
        if incompleteItemCount == 0 {
            presentAllDoneAlertController()
        }
    }
    
    func markToDoItemAsComplete(cell: ToDoTableViewCell) {
        guard let index = tableView.indexPath(for: cell),
              let toDoGroup = toDoGroup else { return }
        
        let toDo = toDoGroup.toDoList[index.row]
        
        ToDoGroupController.sharedInstance.toggleToDoItemIsComplete(toDo: toDo)
        
        cell.update(toDo: toDo)
    }
}
