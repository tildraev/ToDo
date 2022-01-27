//
//  ToDo.swift
//  ToDo
//
//  Created by Arian Mohajer on 1/27/22.
//

import Foundation

class ToDo {
    let name: String
    var isComplete: Bool
    
    init(name: String, isComplete: Bool = false) {
        self.name = name
        self.isComplete = isComplete
    }
}

extension ToDo: Equatable {
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
        lhs.isComplete == rhs.isComplete &&
        lhs.name == rhs.name
    }
}
