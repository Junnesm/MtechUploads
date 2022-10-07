//
//  IntroVC.swift
//  PersonalityQuiz
//
//  Created by Junne Murdock on 10/5/22.
//

import UIKit

class IntroVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func startQuizPressed(_ sender: Any) {
        performSegue(withIdentifier: "startQuiz", sender: nil)
        
        
    }
    
    @IBAction func unwindToIntroVC(segue: UIStoryboardSegue) {}
    
    }



