//
//  ListController.swift
//  ToDo
//
//  Created by iMac Pro on 2/15/23.
//

import Foundation

class ListController {
    
    static let sharedInstance = ListController()
    var lists: [List] = []
    
    init() {
        loadLists()
    }
    
    //MARK: - CRUD
    func createList(name: String, listItems: [Item] = []) {
        let newList = List(listName: name)
        lists.append(newList)
        
        saveLists()
    } //: CREATE
    
    
    func deleteList(listToDelete: List) {
        guard let listIndex = lists.firstIndex(of: listToDelete) else { return }
        lists.remove(at: listIndex)
        
        saveLists()
    } //: DELETE
    
    
    //MARK: - FUNCTIONS
    func toggleListIsCompleted(list: List) {
        list.listIsCompleted.toggle()
        saveLists()
    } //: TOGGLE isCompleted
    
    
    
    
    
    //MARK: - PERSISTENCE
    private var listsURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let finalURL = documentsDirectory.appendingPathComponent("lists.json")
        return finalURL
    } //: LOCAL STORAGE LOCATION
    
    
    func saveLists() {
        guard let url = listsURL else { return }
        do {
            let data = try JSONEncoder().encode(lists)
            try data.write(to: url)
        } catch {
            print("Error Saving Lists:", error.localizedDescription)
        } //: DO-CATCH
    } //: SAVE
    
    
    func loadLists() {
        guard let url = listsURL else { return }
        do {
            let retreivedData = try Data(contentsOf: url)
            let decodedLists  = try JSONDecoder().decode([List].self, from: retreivedData)
            self.lists        = decodedLists
        } catch {
            print("Error Loading Lists:", error.localizedDescription)
        } //: DO-CATCH
    } //: LOAD
    
} //: CLASS
