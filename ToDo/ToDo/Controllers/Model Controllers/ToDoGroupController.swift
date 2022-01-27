//
//  ToDoGroupController.swift
//  ToDo
//
//  Created by Arian Mohajer on 1/27/22.
//

import Foundation

class ToDoGroupController {
    //Singleton
    static var sharedInstance = ToDoGroupController()
    
    //Source of truth
    var toDoGroupList: [ToDoGroup] = []
    
    // MARK: - CRUD Functions
    
    func createToDoGroup(named name: String) {
        let toDoGroup = ToDoGroup(name: name)
        toDoGroupList.append(toDoGroup)
    }
    
    func deleteToDoGroup(toDoGroup: ToDoGroup) {
        guard let index = toDoGroupList.firstIndex(where: {$0 == toDoGroup}) else { return }
        toDoGroupList.remove(at: index)
    }
}
