//
//  ScoreBoardTableViewController.swift
//  ScoreKeeperApp
//
//  Created by Junne Murdock on 11/8/22.
//

import UIKit

class ScoreBoardTableViewController: UITableViewController, AddPlayerViewControllerDelegate {
    
    
    func newPlayerData(player: String, score: Int) {
        var newPlayer = Players(name: player, currentScore: score)
        players.append(newPlayer)
        tableView.reloadData()
    }
    
    
    var players: [Players] = [
        Players(name: "Junne", currentScore: 420),
        Players(name: "Ami", currentScore: 33),
        Players(name: "Nelson", currentScore: 69)
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150.0
        
    }
    
    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreboardCell", for: indexPath) as! ScoreboardTableViewCell
        
        let newPlayer = players[indexPath.row]
        
        cell.update(with: newPlayer)
        cell.showsReorderControl = true
        
        
        return cell
    }
    
    
    @IBSegueAction func segueAction(_ coder: NSCoder, sender: Any?) -> AddPlayerViewController? {
        
        let newViewController = AddPlayerViewController(coder: coder)
        
        newViewController?.delegate = self
        return newViewController
    }
}

