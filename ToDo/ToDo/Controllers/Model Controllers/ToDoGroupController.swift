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
    
    func createToDoItem(group: ToDoGroup, name: String) {
        let newToDoItem = ToDo(name: name)
        group.toDoList.append(newToDoItem)
    }
    
    func deleteToDoItem(group: ToDoGroup, toDo: ToDo) {
        guard let index = group.toDoList.firstIndex(of: toDo) else { return }
        group.toDoList.remove(at: index)
    }
    
    func toggleToDoItemIsComplete(toDo: ToDo) {
        toDo.isComplete.toggle()
    }
    
    func toggleToDoGroupIsComplete(group: ToDoGroup) {
        group.isComplete.toggle()
    }
}
