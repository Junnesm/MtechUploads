//
//  ViewController.swift
//  introFamilyProjectPt2
//
//  Created by Junne Murdock on 10/31/22.
//

import UIKit

class ViewController: UIViewController {
    
    var entry: FamilyInfo?
    
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var familyPhoto: UIImageView!
    
    @IBOutlet weak var familyAbout: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let entry = entry else { return }
        
        nameLabel.text = entry.name
        familyAbout.text = entry.familyDescription
        familyPhoto.image = UIImage(named: entry.familyPicture)
    }


}

