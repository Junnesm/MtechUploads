//
//  TallyViewController.swift
//  TallyApp
//
//  Created by Junne Murdock on 9/29/22.
//

import UIKit

class MyViewController: UIViewController {
    var intervalAmount = " "
    //input of tallies in bulk
    
    
    
    @IBOutlet weak var tallyButton: UIButton!
//    @IBOutlet weak var numberInput: UITextField!
    @IBOutlet weak var tallyResult: UILabel! // update Ui to new value
    @IBOutlet weak var tallySlider: UISlider!
    
    @IBOutlet weak var numberCountLabel: UILabel!
    
    var value = 0
    struct Settings {
        var name = " "
        var startingNumber = 1
        var counter = 0
    }
    var myTally = Settings()
    var tally = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberCountLabel.text =  "\(Int(tallySlider.value))"
        
        value = myTally.startingNumber
        updateTally()
    }
    
    func updateTally () {
        tallyResult.text = "\(value)"
    }
    
    
    @IBAction func tallyButtonPressed(_ sender: UIButton) {
        value += myTally.counter
        updateTally()
    
        }
  
    @IBAction func tallyDidSlide(_ sender: UISlider) {
        myTally.counter = Int(sender.value)
        numberCountLabel.text = String(myTally.counter)
    }
}
    
    //takes amount to count by
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
