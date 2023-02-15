//
//  List.swift
//  ToDo
//
//  Created by iMac Pro on 2/15/23.
//

import Foundation

class List: Codable {
    let listName: String
    var list: [Item]
    var listIsCompleted: Bool
    let id: UUID
    
    init(listName: String, list: [Item] = [], listIsCompleted: Bool = false, id: UUID = UUID()) {
        self.listName = listName
        self.list = list
        self.listIsCompleted = listIsCompleted
        self.id = id
    }
    
} //: CLASS
