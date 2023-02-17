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
    } //: DidLOAD
    
    
    //MARK: - ACTIONS
    @IBAction func addItemButtonTapped(_ sender: Any) {
        guard let list = listReceiver,
              let newItemName = itemNameTextField.text else { return }
        if newItemName.isEmpty {
            presentUnnamedItemAlertController()
        } else {
            ItemController.createItem(newItemName: newItemName, lists: list)
        }
        tableView.reloadData()
    } //: ADD ITEM TAPPED

    
    //MARK: - ALERTS
    private func presentClearAllItemsAlertController() {
        let alertController = UIAlertController(title: "All Done!",
                                                message: "Would you like to remove these items?",
                                                preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Keep", style: .cancel)
        let confirmClearItemsAction = UIAlertAction(title: "Clear Items", style: .default) { _ in
            guard let listReceiver = self.listReceiver else { return }
            ItemController.clearAllItemsFromList(list: listReceiver)
            self.tableView.reloadData()
        } //: Confirm CLEAR ITEMS
        
        let confirmDeleteListAction = UIAlertAction(title: "Delete List", style: .destructive) { _ in
            guard let list = self.listReceiver else { return }
            ListController.sharedInstance.deleteList(listToDelete: list)
            self.navigationController?.popViewController(animated: true)
        } //: Confirm DELETE LIST
        
        alertController.addAction(dismissAction)
        alertController.addAction(confirmClearItemsAction)
        alertController.addAction(confirmDeleteListAction)
        present(alertController, animated: true)
    } //: ALERT CLEAR ALL
    
    
    private func presentUnnamedItemAlertController() {
        let alertController = UIAlertController(title: "Empty TextField",
                                                message: "Please give the Item a name.",
                                                preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    } //: ALERT NO NAME
    
    
    // MARK: - TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listReceiver?.listItems.count ?? 0
    } //: # ROWS
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemsTableViewCell,
              let listReceiver = listReceiver else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        let itemReceived = listReceiver.listItems[indexPath.row]
        cell.item        = itemReceived
        cell.delegate    = self
        
        return cell
    } //: itemCell CONFIG
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let listReceiver = listReceiver else { return }
            let deleteThisItem = listReceiver.listItems[indexPath.row]
            ItemController.deleteItem(itemToDelete: deleteThisItem, from: listReceiver)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    } //: EDIT STYLE
} //: CLASS


//MARK: - EXTENSION ItemTableViewCellDelegate
extension ItemsTableViewController: ItemTableViewCellDelegate {
    func toggleItemIsCompletedButtonWasTapped(cell: ItemsTableViewCell) {
        guard let itemCellIndex = tableView.indexPath(for: cell),
              let listReceiver = listReceiver else { return }
        let item = listReceiver.listItems[itemCellIndex.row]
        ItemController.toggleItemIsCompleted(item: item)
        cell.updateItemCellViews()
        checkIsAllCompleted()
    }
    
    
    private func checkIsAllCompleted() {
        guard let list = listReceiver else { return }
        for item in list.listItems {
            if item.itemIsCompleted == false {
                return
            }
        }
        
        presentClearAllItemsAlertController()
    }
} //: EXTENSION
