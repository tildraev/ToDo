//
//  ToDoController.swift
//  ToDo
//
//  Created by Arian Mohajer on 1/27/22.
//

import Foundation

class ToDoController {
    //Singleton
    static var sharedInstance = ToDoController()
    
    //Source of truth
    var toDoList: [ToDo] = []
    
    // MARK: - CRUD Functions
    func createToDo(named name: String){
        let toDoItem = ToDo(name: name)
        toDoList.append(toDoItem)
    }
}
