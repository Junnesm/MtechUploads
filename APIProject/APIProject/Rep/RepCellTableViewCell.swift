//
//  RepCellTableViewCell.swift
//  APIProject
//
//  Created by Junne Murdock on 12/14/22.
//

import UIKit

class RepCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    
}
