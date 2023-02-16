//
//  ListsTableViewController.swift
//  ToDo
//
//  Created by iMac Pro on 2/15/23.
//

import UIKit

class ListsTableViewController: UITableViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var listNameTextField: UITextField!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    } //: DidLOAD

    
    //MARK: - ACTIONS
    @IBAction func createListButtonTapped(_ sender: Any) {
        
    } //: CREATE LIST TAPPED
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListController.sharedInstance.lists.count
    } //: #ROWS

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListsTableViewCell else { return UITableViewCell() }

        let listIndex = ListController.sharedInstance.lists[indexPath.row]
        cell.updateListCellViews(list: listIndex)
        
        return cell
    } //: CELL CONFIG


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //: DELETE
    } //: EDIT STYLE


    // MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemsTableVC" {
            if let index = tableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? ItemsTableViewController {
                    let listSender = ListController.sharedInstance.lists[index.row]
                    destinationVC.listReceiver = listSender
                } //: DESTINATION
            } //: INDEX
        } //: IDENTIFIER
    } //: SEGUE

} //: CLASS
