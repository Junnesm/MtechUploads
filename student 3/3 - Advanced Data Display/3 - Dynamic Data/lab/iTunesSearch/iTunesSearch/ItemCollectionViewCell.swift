//
//  ItemCollectionViewCell.swift
//  iTunesSearch
//
//  Created by Junne Murdock on 1/23/23.
//

import UIKit




class ItemCollectionViewCell: UICollectionViewCell, ItemDisplaying {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
}
