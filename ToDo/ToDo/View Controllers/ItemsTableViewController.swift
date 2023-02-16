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
        
    } //: ADD ITEM TAPPED
    
    
    //MARK: - HELPER FUNCTIONS
    func updateViews() {
        
    } //: UPDATE VIEWS
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    } //: # ROWS


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)


        return cell
    } //: CELL CONFIG


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //: DELETE
    } //: EDIT STYLE

} //: CLASS
