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
        lists.listItems.append(newItem)
        
        ListController.sharedInstance.saveLists()
    } //: CREATE
    
    
    static func deleteItem(itemToDelete: Item, from list: List) {
        guard let itemIndex = list.listItems.firstIndex(of: itemToDelete) else { return }
        list.listItems.remove(at: itemIndex)
        
        ListController.sharedInstance.saveLists()
    } //: DELETE
    
} //: CLASS
