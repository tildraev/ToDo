//
//  ToDoGroupTableViewController.swift
//  ToDo
//
//  Created by Arian Mohajer on 1/27/22.
//

import UIKit

class ToDoGroupTableViewController: UITableViewController {

    @IBOutlet weak var newToDoGroupTextField: UITextField!
    @IBOutlet weak var createNewToDoGroupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoGroupController.sharedInstance.toDoGroupList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "toDoGroupCell", for: indexPath) as? ToDoGroupCellTableViewCell else { return UITableViewCell() }

        // Grab to do group we're working on
        let toDoGroup = ToDoGroupController.sharedInstance.toDoGroupList[indexPath.row]

        // Configure the cell's button
        let isCompleteImageName = toDoGroup.isComplete ? "checkmark.diamond.fill" : "checkmark.diamond"
        let isCompleteImage = UIImage(systemName: isCompleteImageName)
        cell.toDoGroupIsCompletedButton.setImage(isCompleteImage, for: .normal)
        
        // Configure the cell's label
        cell.toDoGroupLabel.text = toDoGroup.name
        
        // Configure the cell's count label
        cell.toDoGroupCountLabel.text = "\(toDoGroup.toDoList.count)"

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let toDoGroup = ToDoGroupController.sharedInstance.toDoGroupList[indexPath.row]
            ToDoGroupController.sharedInstance.deleteToDoGroup(toDoGroup: toDoGroup)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    @IBAction func createNewToDoButtonTapped(_ sender: Any) {
        
        guard let groupName = newToDoGroupTextField.text, !groupName.isEmpty else { return }
        ToDoGroupController.sharedInstance.createToDoGroup(named: groupName)
        tableView.reloadData()
    }
    
}
