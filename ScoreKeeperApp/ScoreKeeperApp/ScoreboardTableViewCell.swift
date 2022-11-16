//
//  ScoreboardTableViewCell.swift
//  ScoreKeeperApp
//
//  Created by Ami Smith on 11/8/22.
//

import UIKit

protocol ScoreBoardTableViewCellDelegate: AnyObject {
    func playerWasUpdated(score: Int, row: Int)
    
}


class ScoreboardTableViewCell: UITableViewCell {
    
    var player: Player?
    var delegate: ScoreBoardTableViewCellDelegate?
    var row: Int?
    
    @IBOutlet weak var scoreStepper: UIStepper!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateScore()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func update(with player: Player) {
        playerLabel.text = player.name
        playerScoreLabel.text = String(player.currentScore)
        scoreStepper.value = Double(player.currentScore)
    }
    
    func updateScore() {
        
    }
    
    
    @IBAction func stepperButtonTapped(_ sender: UIStepper) {
        playerScoreLabel.text = "\(Int(scoreStepper.value))"
        
        delegate?.playerWasUpdated(score: Int(scoreStepper.value), row: self.row!)
    
    }
}
