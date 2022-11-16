//
//  AddPlayerViewController.swift
//  ScoreKeeperApp
//
//  Created by Ami Smith on 11/8/22.
//

import UIKit

protocol AddPlayerViewControllerDelegate {
    func newPlayerData(player: String, score: Int)
    
}

class AddPlayerViewController: UIViewController {
    
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var currentScoreTextField: UITextField!
    
    var delegate: AddPlayerViewControllerDelegate?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    

    
    
    
    
    @IBAction func savePlayerButtonTapped(_ sender: UIButton) {
        let playerText = playerNameTextField.text ?? ""
        let score = Int(currentScoreTextField.text ?? "") ?? 0
        
        delegate?.newPlayerData(player: playerText, score: score)
        
        self.dismiss(animated: false)
        
        
        // guard to make sure that there is text in the playerText property
        // use `isEmpty` method on string
        
        guard !playerText.isEmpty else {
            return
        }
        
    }
    
}

