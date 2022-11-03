//
//  FamilyTableViewController.swift
//  introFamilyProjectPt2
//
//  Created by Junne Murdock on 10/31/22.
//

import UIKit

class FamilyTableViewController: UITableViewController {
    
    let familyMembers = FamilyInfo.familyMembers
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
   
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return familyMembers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentFamilyMember = familyMembers[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "familyMemberCell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = currentFamilyMember.name
        
        cell.contentConfiguration = config
    
       return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? IndexPath, let detailViewController = segue.destination as? ViewController else{
            fatalError()
        }
        detailViewController.entry = familyMembers[indexPath.row]
    }
    
    }
    


