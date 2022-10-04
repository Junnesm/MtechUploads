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
    var username: String = " "
    var password: String = " "
    
    @IBAction func passwordAction(_ sender: UITextField) {
    }
    
    @IBAction func loginButtonPushed(_ sender: UIButton) {
        
    
        var message = " "
        if isValidPassword(passwordInput.text ?? "") {
          message = "Succesfully Entered Password"
              performSegue(withIdentifier: "WelcomeToTheClubSegue", sender: nil)
            
            
        } else {
            message = "Missing Criteria"
        }
        let alert = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
        let okayButton = UIAlertAction (title: NSLocalizedString("OK", comment: "Default Action"), style: .default, handler: nil)
        let resetButton = UIAlertAction(title: NSLocalizedString("Reset", comment: "Default Action"), style: .destructive, handler: { _ in self.passwordInput.text = ""
            
        })
        
        alert.addAction(okayButton)
        alert.addAction(resetButton)
        
        self.present(alert, animated: true, completion: nil)
    }
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    public func isValidPassword(_ password: String) -> Bool {
        
            let symbols = "~`!@#$%^&*-_=+?<>."
            var hasSymbol = false
            
            for character in password {
                hasSymbol = symbols.contains(character)
                if hasSymbol { break }
            }
            
            return password.count >= 8 && hasSymbol
        
        }
    }
    
    
    


        
    


