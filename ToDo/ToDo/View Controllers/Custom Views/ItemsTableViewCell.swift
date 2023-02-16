//
//  ItemsTableViewCell.swift
//  ToDo
//
//  Created by iMac Pro on 2/15/23.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {

    //MARK: - OUTLETS
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemIsCheckedButton: UIButton!
    
    
    //MARK: - PROPERTIES
    var item: Item? {
        didSet {
            updateItemCellViews()
        } //: PROPERTY OBSERVER
    } //: COMPUTED
    
    
    //MARK: - HELPER FUNCTIONS
    func updateItemCellViews() {
        guard let item = item else { return }
        itemNameLabel.text = item.itemName
        
        let imageName   = item.itemIsCompleted ? "checkmark.square.fill" : "checkmark.square"
        let image       = UIImage(systemName: imageName)
        itemIsCheckedButton.setImage(image, for: .normal)
    } //: UPDATE ITEMS VIEWS
    
    
    //MARK: - ACTIONS
    @IBAction func itemIsCheckedButtonTapped(_ sender: Any) {
        
    } //: BUTTON CHECKED

} //: CLASS
