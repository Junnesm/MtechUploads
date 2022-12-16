

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    @IBAction func enterButtonDidTouchUpInside(_ sender: Any) {
        if emailTextField.text?.isEmpty == true {
            TextFieldShakeAnimation()
        } else {
            performSegue(withIdentifier: "toEnteredView", sender: nil)
        }
        
    }
    
    private func TextFieldShakeAnimation() {
        UIView.animate(withDuration: 0.6, animations: {
            let rightTransform  = CGAffineTransform(translationX: 20, y: 0)
            self.emailTextField.transform = rightTransform
        }) { (_) in
            UIView.animate(withDuration: 0.6, animations: {
                self.emailTextField.transform = CGAffineTransform.identity
            })
        }
        
    }
}

