//
//  ViewController.swift
//  Text Validation app
//
//  Created by Junne Murdock on 10/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func passwordAction(_ sender: UITextField) {
    }
    
    @IBAction func loginButtonPushed(_ sender: UIButton) {
    
}

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
        func isValidPassword() -> Bool {
            let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,}"
            return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
        }
    if isValidPassword == passwordInput.text {
        return "Succesful"
    } else {
        return "Requirements not met"
    }
    }
    


        
    


