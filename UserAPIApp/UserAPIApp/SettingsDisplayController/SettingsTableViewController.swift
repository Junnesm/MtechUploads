//
//  SettingsTableViewController.swift
//  UserAPIApp
//
//  Created by Junne Murdock on 2/27/23.
//

import UIKit


class SettingsTableViewController: UITableViewController {
    
    var inclusionParameters = [String]()
    var steppers = 1
    
    @IBOutlet var switchOutlets: [UISwitch]!
    @IBOutlet weak var numberOfUsersLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchOutlets[0].tag = 0
        switchOutlets[1].tag = 1
        switchOutlets[2].tag = 2
        switchOutlets[3].tag = 3
        switchOutlets[4].tag = 4
        switchOutlets[5].tag = 5
        switchOutlets[6].tag = 6
        switchOutlets[7].tag = 7
        switchOutlets[8].tag = 8
        switchOutlets[9].tag = 9
        stepper.value = 1
        numberOfUsersLabel.text = "1"
        overrideUserInterfaceStyle = .dark
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableViewSegue" {
            if let destinationVC = segue.destination as? DisplayUsersTableViewController {
                 destinationVC.inclusionParameters = inclusionParameters
                destinationVC.userAmount = steppers
            }
        }
    }
    
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        tableView.reloadData()
        let parameter: String
        
        switch sender.tag {
        case 0:
            parameter = "location"
        case 1:
            parameter = "gender"
        case 2:
            parameter = "email"
        case 3:
            parameter = "login"
        case 4:
            parameter = "registered"
        case 5:
            parameter = "dob"
        case 6:
            parameter = "phone"
        case 7:
            parameter = "cell"
        case 8:
            parameter = "id"
        case 9:
            parameter = "nat"
        default:
            parameter = ""
            break
        }
        if sender.isOn {
            inclusionParameters.append(parameter)
        } else {
            inclusionParameters.removeAll { value in
                value == parameter
            }
        }
    }
    
    @IBAction func numberOfUsersStepper(_ sender: UIStepper) {
        numberOfUsersLabel.text = "\(Int(stepper.value))"
        steppers = (Int(stepper.value))
    }
}
