//
//  AddPlayerViewController.swift
//  ScoreKeeperApp
//
//  Created by Junne Murdock on 11/8/22.
//

import UIKit

protocol AddPlayerViewControllerDelegate {
    func newPlayerData (player: String, score: Int)
}


class AddPlayerViewController: UIViewController {
    
  
    
    @IBOutlet weak var playNameTextField: UITextField!
    @IBOutlet weak var currentScoreTextField: UITextField!
    
    var delegate: AddPlayerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    
    
    @IBAction func savePlayerButtonTapped(_ sender: Any) {
        let playerText = playNameTextField.text ?? ""
        let score = Int(currentScoreTextField.text ?? "") ?? 0
        
        delegate?.newPlayerData(player: playerText, score: score)
        
        self.dismiss(animated: false)
        
        
        guard !playerText.isEmpty else {
            return
        }
    }
    
}

    

    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


