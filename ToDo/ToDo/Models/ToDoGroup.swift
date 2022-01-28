//
//  ToDoGroup.swift
//  ToDo
//
//  Created by Arian Mohajer on 1/27/22.
//

import Foundation

class ToDoGroup {
    let name: String
    var toDoList: [ToDo]
    var isComplete: Bool
    
    init(name: String, toDoList: [ToDo] = [], isComplete: Bool = false) {
        self.name = name
        self.toDoList = toDoList
        self.isComplete = isComplete
    }
}

extension ToDoGroup: Equatable {
    static func == (lhs: ToDoGroup, rhs: ToDoGroup) -> Bool {
        lhs.isComplete == rhs.isComplete &&
        lhs.toDoList == rhs.toDoList &&
        lhs.name == rhs.name
    }
}

