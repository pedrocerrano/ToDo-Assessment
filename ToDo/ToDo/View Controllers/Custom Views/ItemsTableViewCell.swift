//
//  ItemsTableViewCell.swift
//  ToDo
//
//  Created by iMac Pro on 2/15/23.
//

import UIKit

protocol ItemTableViewCellDelegate: AnyObject {
    func toggleItemIsCompletedButtonWasTapped(cell: ItemsTableViewCell)
} //: PROTOCOL

class ItemsTableViewCell: UITableViewCell {

    //MARK: - OUTLETS
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemIsCompletedButton: UIButton!
    
    
    //MARK: - PROPERTIES
    var item: Item? {
        didSet {
            updateItemCellViews()
        } //: PROPERTY OBSERVER
    } //: COMPUTED
    weak var delegate: ItemTableViewCellDelegate?
    
    
    //MARK: - HELPER FUNCTIONS
    func updateItemCellViews() {
        guard let item = item else { return }
        itemNameLabel.text = item.itemName
        
        let imageName   = item.itemIsCompleted ? "checkmark.square.fill" : "checkmark.square"
        let image       = UIImage(systemName: imageName)
        itemIsCompletedButton.setImage(image, for: .normal)
    } //: UPDATE ITEMS VIEWS
    
    
    //MARK: - ACTIONS
    @IBAction func itemIsCompletedButtonTapped(_ sender: Any) {
        delegate?.toggleItemIsCompletedButtonWasTapped(cell: self)
    } //: IsCompleted TAPPED

} //: CLASS
