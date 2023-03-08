//
//  DisplayUserTableViewCell.swift
//  UserAPIApp
//
//  Created by Junne Murdock on 2/28/23.
//

import UIKit

class DisplayUserTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var registeredLabel: UILabel!
    @IBOutlet weak var dOBLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var iDLabel: UILabel!
    @IBOutlet weak var natLabel: UILabel!
    
    
    @IBOutlet weak var emailIdentifier: UILabel!
    @IBOutlet weak var loginIdentifier: UILabel!//not connecting
    @IBOutlet weak var registeredIdentifier: UILabel!
    @IBOutlet weak var dOBIdentifier: UILabel!
    @IBOutlet weak var phoneIdentifier: UILabel!
    @IBOutlet weak var cellIdentifier: UILabel!
    @IBOutlet weak var iDIdentifier: UILabel!
    @IBOutlet weak var natIdentifier: UILabel!
    @IBOutlet weak var genderIdentifier: UILabel!
    @IBOutlet weak var locationIdentifier: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
