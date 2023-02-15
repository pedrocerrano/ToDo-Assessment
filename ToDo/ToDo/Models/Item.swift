//
//  Item.swift
//  ToDo
//
//  Created by iMac Pro on 2/15/23.
//

import Foundation

class Item: Codable {
    let itemName: String
    var itemIsCompleted: Bool
    let id: UUID
    
    init(itemName: String, itemIsCompleted: Bool = false, id: UUID = UUID()) {
        self.itemName        = itemName
        self.itemIsCompleted = itemIsCompleted
        self.id              = id
    } //: MEMBERWISE INITIALIZER
    
} //: CLASS


extension Item: Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
} //: EXTENSION
