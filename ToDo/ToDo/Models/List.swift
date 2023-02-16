//
//  List.swift
//  ToDo
//
//  Created by iMac Pro on 2/15/23.
//

import Foundation

class List: Codable {
    let listName: String
    var listItems: [Item]
    var listIsCompleted: Bool
    let id: UUID
    
    init(listName: String, listItems: [Item] = [], listIsCompleted: Bool = false, id: UUID = UUID()) {
        self.listName = listName
        self.listItems = listItems
        self.listIsCompleted = listIsCompleted
        self.id = id
    }
    
} //: CLASS


extension List: Equatable {
    static func == (lhs: List, rhs: List) -> Bool {
        return lhs.id == rhs.id
    }
} //: EXTENSION
