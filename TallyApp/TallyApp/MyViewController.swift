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
    }
}
    
    //takes amount to count by
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
