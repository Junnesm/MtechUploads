//
//  ViewController.swift
//  TechSocialMediaApp
//
//  Created by Junne Murdock on 10/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePic.layer.borderWidth = 5
        profilePic.layer.borderColor = UIColor.white.cgColor
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        profilePic.clipsToBounds = true
         
    }
    


}

