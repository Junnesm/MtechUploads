//
//  ScoreboardTableViewController.swift
//  ScoreKeeperApp
//
//  Created by Ami Smith on 11/8/22.
//

import UIKit


class ScoreboardTableViewController:  UITableViewController, AddPlayerViewControllerDelegate, ScoreBoardTableViewCellDelegate {
  
    
    func playerWasUpdated(score: Int, row: Int) {
        players[row].currentScore = Int(score)
        players.sort()

        tableView.reloadData()
        
    }
    
    
    var player: Player?
  
    
    func newPlayerData(player: String, score: Int) {
        let newPlayer = Player(name: player, currentScore: score)
        players.append(newPlayer)
        players.sort()
        tableView.reloadData()
    }
    
    
    var players: [Player] = [
    Player(name: "Ami", currentScore: 6),
    Player(name: "Junne", currentScore: 4),
    Player(name: "Nelson", currentScore: 7)

    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        players.sort() { $1.currentScore < $0.currentScore }
        
        
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
        
        cell.row = indexPath.row
        
        cell.update(with: newPlayer)
        cell.showsReorderControl = true
    
        cell.delegate = self
        
        return cell
    }

    
    @IBSegueAction func segueAction(_ coder: NSCoder, sender: Any?) -> AddPlayerViewController? {
        let newViewController = AddPlayerViewController(coder: coder)
        
        newViewController?.delegate = self
        
        return newViewController
    }
    
    
    }




    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

//   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }


//    Override to support conditional rearranging of the table view.

func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    
    
    return true
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
