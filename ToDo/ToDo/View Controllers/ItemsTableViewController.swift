//
//  ItemsTableViewController.swift
//  ToDo
//
//  Created by iMac Pro on 2/15/23.
//

import UIKit

class ItemsTableViewController: UITableViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var itemNameTextField: UITextField!
    
    
    //MARK: - PROPERTIES
    var listReceiver: List?
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    } //: DidLOAD
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    } //: WillAPPEAR
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
// Set remove checked items here
    } //: WillDISAPPEAR

    
    //MARK: - ACTIONS
    @IBAction func addItemButtonTapped(_ sender: Any) {
        guard let listReceiver = listReceiver,
              let newItemName = itemNameTextField.text, !newItemName.isEmpty else { return }
        ItemController.createItem(newItemName: newItemName, lists: listReceiver)
        tableView.reloadData()
    } //: ADD ITEM TAPPED
// Need to clear textfield when tapping Add
    
    
    //MARK: - HELPER FUNCTIONS
    func updateViews() {
// This will be for the text field
    } //: UPDATE VIEWS
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listReceiver?.listItems.count ?? 0
    } //: # ROWS


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemsTableViewCell,
              let listReceiver = listReceiver else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        let itemReceived = listReceiver.listItems[indexPath.row]
        cell.item        = itemReceived

        return cell
    } //: CELL CONFIG


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let listReceiver = listReceiver else { return }
            let deleteThisItem = listReceiver.listItems[indexPath.row]
            ItemController.deleteItem(itemToDelete: deleteThisItem, from: listReceiver)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //: DELETE
    } //: EDIT STYLE

} //: CLASS
