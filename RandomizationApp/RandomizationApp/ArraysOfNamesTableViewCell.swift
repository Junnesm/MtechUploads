//
//  ArraysOfNamesTableViewCell.swift
//  RandomizationApp
//
//  Created by Junne Murdock on 2/27/23.
//

import UIKit

//dont forget the identifier for showing name labels


class ArraysOfNamesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var arrayOfNamesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
