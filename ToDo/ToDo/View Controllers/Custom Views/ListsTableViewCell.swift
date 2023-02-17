//
//  ListsTableViewCell.swift
//  ToDo
//
//  Created by iMac Pro on 2/15/23.
//

import UIKit

protocol ListTableViewCellDelegate: AnyObject {
    func toggleIsCompletedButtonWasTapped(cell: ListsTableViewCell)
} //: PROTOCOL


class ListsTableViewCell: UITableViewCell {

    //MARK: - OUTLETS
    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var isCompletedButton: UIButton!
    
    
    //MARK: - PROPERTIES
    weak var delegate: ListTableViewCellDelegate?
    
    
    //MARK: - HELPER FUNCTIONS
    func updateListCellViews(list: List) {
        listNameLabel.text  = list.listName
        itemCountLabel.text = "\(list.listItems.count)"
        
        let image = list.listIsCompleted ? UIImage(systemName: "checkmark.diamond.fill") : UIImage(systemName: "checkmark.diamond")
        isCompletedButton.setImage(image, for: .normal)
    } //: UPDATE VIEWS
    
    
    //MARK: - ACTIONS
    @IBAction func isCompletedButtonTapped(_ sender: Any) {
        delegate?.toggleIsCompletedButtonWasTapped(cell: self)
    } //: IsCompleted TAPPED

} //: CLASS
