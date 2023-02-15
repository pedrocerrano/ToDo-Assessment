//
//  ListsTableViewCell.swift
//  ToDo
//
//  Created by iMac Pro on 2/15/23.
//

import UIKit

class ListsTableViewCell: UITableViewCell {

    //MARK: - OUTLETS
    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var isCheckedButton: UIButton!
    
    
    //MARK: - PROPERTIES
    
    
    
    //MARK: - HELPER FUNCTIONS
    func updateViews(list: List) {
        listNameLabel.text  = list.listName
        itemCountLabel.text = "\(list.listItems.count)"
        
        let image = list.listIsCompleted ? UIImage(systemName: "checkmark.diamond.fill") : UIImage(systemName: "checkmark.diamond")
        isCheckedButton.setImage(image, for: .normal)
    } //: UPDATE VIEWS
    
    
    //MARK: - ACTIONS
    @IBAction func isCheckedButtonTapped(_ sender: Any) {
        
    } //: IS CHECKED TAPPED

} //: CLASS
