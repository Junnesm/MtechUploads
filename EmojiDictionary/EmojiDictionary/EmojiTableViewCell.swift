//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by Junne Murdock on 10/19/22.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func update(with emoji:Emoji){
        emojiLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLable.text = emoji.description
        
        
        
        
    }

}
