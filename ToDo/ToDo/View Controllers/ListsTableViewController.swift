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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    //MARK: - ACTIONS
    @IBAction func createListButtonTapped(_ sender: Any) {
        guard let newListName = listNameTextField.text else { return }
        if newListName.isEmpty {
            presentEmptyTextFieldAlertController()
        } else {
            ListController.sharedInstance.createList(name: newListName)
        }
        tableView.reloadData()
    } //: CREATE LIST TAPPED
    
    
    //MARK: - FUNCTIONS
    func presentEmptyTextFieldAlertController() {
        let alertController = UIAlertController(title: "Empty TextField", message: "Please give the List a name.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListController.sharedInstance.lists.count
    } //: #ROWS

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListsTableViewCell else { return UITableViewCell() }

        let listIndex = ListController.sharedInstance.lists[indexPath.row]
        cell.updateListCellViews(list: listIndex)
        cell.delegate = self
        
        return cell
    } //: CELL CONFIG


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteList = ListController.sharedInstance.lists[indexPath.row]
            ListController.sharedInstance.deleteList(listToDelete: deleteList)
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


//MARK: - EXTENSION ListTableViewCellDelegate
extension ListsTableViewController: ListTableViewCellDelegate {
    func toggleIsCompletedButtonWasTapped(cell: ListsTableViewCell) {
        guard let listCellIndex = tableView.indexPath(for: cell) else { return }
        let list = ListController.sharedInstance.lists[listCellIndex.row]
        ListController.sharedInstance.toggleListIsCompleted(list: list)
        cell.updateListCellViews(list: list)
    } //: IMPLEMENTATION
} //: EXTENSION
