//
//  ToDoTableViewCell.swift
//  ToDo
//
//  Created by Arian Mohajer on 1/27/22.
//

import UIKit

protocol ToDoTableViewCellDelegate: AnyObject {
    func markToDoItemAsComplete(cell: ToDoTableViewCell)
}

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var toDoItemNameLabel: UILabel!
    @IBOutlet weak var toDoItemIsCompleteButton: UIButton!
    
    weak var delegate: ToDoTableViewCellDelegate?
    
    @IBAction func toDoItemIsCompleteButtonTapped(_ sender: Any) {
        delegate?.markToDoItemAsComplete(cell: self)
    }
    
    func update(toDo: ToDo) {
        let toDoItemIsCompleteImageString = toDo.isComplete ? "checkmark.square.fill" : "checkmark.square"
        let toDoItemIsCompleteImage = UIImage(systemName: toDoItemIsCompleteImageString)
        toDoItemIsCompleteButton.setImage(toDoItemIsCompleteImage, for: .normal)
    }
}
