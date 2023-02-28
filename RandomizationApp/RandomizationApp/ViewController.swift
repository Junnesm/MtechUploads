//
//  ViewController.swift
//  RandomizationApp
//
//  Created by Junne Murdock on 2/24/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate { //table views are for showing
    
    var textFieldData: String?
    var names = [Name]()
    var myArray = [String]()
    
  
    
    
    @IBOutlet weak var arrayOfNamesTableView: UITableView! // to show names on view controller
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func enterNameButtonTapped(_ sender: UIButton) {
        storeTextFieldNames(_textField: textField)
    }
    
    
    @IBAction func randomizerButtonTapped(_ sender: UIButton) {
       // textField.text = name[Int.random(in: 0...4)]
        randomName()
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //showing names of array
        arrayOfNamesTableView.delegate = self ///
        arrayOfNamesTableView.dataSource = self
       
        
        // Do any additional setup after loading the view.
    }
    func storeTextFieldNames(_textField: UITextField) {
        let inputText = textField.text
        if let text = inputText {
            
//            myArray.append(text)
            myArray += text.components(separatedBy: ",")
            textField.text = ""
            print(myArray)
            arrayOfNamesTableView.reloadData()//showing names of array
            // discard myArray variable
        }
        
    }
    func randomName() {
        var name = myArray.randomElement()
        nameLabel.text = name
       
        
    }
    
    //showing name labels
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return myArray.count
       //?????????
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "arrayOfNames", for: indexPath) as! ArraysOfNamesTableViewCell
         let name = myArray[indexPath.row]
         cell.arrayOfNamesLabel.text = name
         return cell
        
    }
    


}

