//
//  ViewController.swift
//  3.6 Lab- Login
//
//  Created by Junne Murdock  on 9/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ForgotUsername: UIButton!
    @IBAction func ForgotUsernameAction(_ sender: UIButton) {
        performSegue(withIdentifier: "LoginViewController", sender: ForgotUsername)
    }
   
    @IBOutlet var ForgotPassword: UIButton!
    
    @IBAction func ForgotPasswordAction(_ sender: UIButton) {
        performSegue(withIdentifier: "LoginViewController", sender: ForgotPassword)
        
    }
    
    @IBOutlet var Username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = Username.text
        guard let sender = sender as? UIButton else {return}
        if sender == ForgotPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == ForgotUsername {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title = Username.text
        }
        
    }

}

