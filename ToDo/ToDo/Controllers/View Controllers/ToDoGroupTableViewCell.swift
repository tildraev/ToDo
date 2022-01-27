//
//  ToDoGroupTableViewCell.swift
//  ToDo
//
//  Created by Arian Mohajer on 1/27/22.
//

import UIKit

protocol ToDoGroupTableViewCellDelegate: AnyObject {
    func markToDoItemGroupAsComplete(cell: ToDoGroupTableViewCell)
}

class ToDoGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var toDoGroupIsCompletedButton: UIButton!
    @IBOutlet weak var toDoGroupLabel: UILabel!
    @IBOutlet weak var toDoGroupCountLabel: UILabel!
    
    weak var delegate: ToDoGroupTableViewCellDelegate?
    
    @IBAction func toDoGroupIsCompletedButtonTapped(_ sender: Any) {
        delegate?.markToDoItemGroupAsComplete(cell: self)
    }
    
    func updateCell(group: ToDoGroup) {
        let isCompleteImageString = group.isComplete ? "checkmark.diamond.fill" : "checkmark.diamond"
        let isCompleteImage = UIImage(systemName: isCompleteImageString)
        toDoGroupIsCompletedButton.setImage(isCompleteImage, for: .normal)
    }
}
