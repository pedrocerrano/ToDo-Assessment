//
//  ItemController.swift
//  ToDo
//
//  Created by iMac Pro on 2/15/23.
//

import Foundation

class ItemController {
    
    //MARK: - CRUD FUNCTIONS
    static func createItem(newItemName: String, lists: List) {
        let newItem = Item(itemName: newItemName)
        lists.list.append(newItem)
        
        ListController.sharedInstance.saveLists()
    } //: CREATE
    
    
    func deleteItem() {
        
        ListController.sharedInstance.saveLists()
    } //: DELETE
    
} //: CLASS
