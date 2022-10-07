//
//  ViewController.swift
//  2.10- AutoLayout and Stack Calculator Project
//
//  Created by Ami Smith on 9/2/22.
//

import UIKit

enum Operation {
    case divide
    case multiply
    case add
    case subtract
    
    
    case negative
    case percentage
}

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var previousNumberPressed = " "
    var operand: Operation?
    
    
    @IBOutlet var calculatedLabel: UILabel!
    //Remember the type of operation clicked
//    var operationClicked: Operation?
    //track the second button clicked
    
    var numbers = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
//        if this is pressed, the label needs to reset to 0
        
    }
    
    @IBAction func posOrNegButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func percentageButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func divideButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func multiplyButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func subtractButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
    }
    @IBAction func equalButtonPressed(_ sender: UIButton) {
        // Something like this, but not this
        //        let intValue = Int(calculatedLabel.text)
        
    }
    
    
    @IBAction func numberPressed(_ button: UIButton) {
        guard let title = calculatedLabel.text, let newNum = button.titleLabel?.text else { return }
        
        if title == "0" {
            calculatedLabel.text = newNum
        } else {
            calculatedLabel.text = title + newNum
        }
        

    
}
    
    @IBAction func calculations(_ button: UIButton) {
        switch button.titleLabel?.text {
        case "Clear":
            calculatedLabel.text = "0"
        case "+":
            previousNumberPressed = calculatedLabel.text!
            operand = .add
            calculatedLabel.text = "0"
        case "-": previousNumberPressed = calculatedLabel.text!
            operand = .subtract
            calculatedLabel.text = "0"
        case "/": previousNumberPressed = calculatedLabel.text!
            operand = .divide
            calculatedLabel.text = "0"
        case "x": previousNumberPressed = calculatedLabel.text!
            operand = .multiply
            calculatedLabel.text = "0"
        case "+/-":
           // previousNumberPressed = calculatedLabel.text!
           // operand = .negative
            //calculatedLabel.text = "0"
            calculatedLabel.text = "\(Double ((calculatedLabel.text)!)! * -1)"
        case "%":
            if let number = Double(calculatedLabel.text!) {
                let percent = "\(number / 100)"
                calculatedLabel.text = percent
            }
            
            
            
        case "=":
            switch operand {
                
            case .add:
                if let firstNum = Double(previousNumberPressed), let secondNum = Double(calculatedLabel.text!) {
                let sum = firstNum + secondNum
                calculatedLabel.text = String(sum)
                }
            case .subtract:
                if let firstNum = Double(previousNumberPressed), let secondNum = Double(calculatedLabel.text!) {
                let difference = firstNum - secondNum
                calculatedLabel.text = String(difference)
                }
            case .divide:
                if let firstNum = Double(previousNumberPressed), let secondNum = Double(calculatedLabel.text!) {
                let quotient = firstNum / secondNum
                calculatedLabel.text = String(quotient)
                }
            case .multiply:
                    if let firstNum = Double(previousNumberPressed), let secondNum = Double(calculatedLabel.text!) {
                let product = firstNum * secondNum
                calculatedLabel.text = String(product)
                    }
                
            case .negative:
                if let firstNum = Double(previousNumberPressed), let _ = Double(calculatedLabel.text!) {
                    let negs = firstNum * -1
                    calculatedLabel.text = String(negs)
                }
            case .percentage:
                print ("not done")
            case .none:
                print("error")
            }
            
        default: print("error")
        }
    

    }
    
}
