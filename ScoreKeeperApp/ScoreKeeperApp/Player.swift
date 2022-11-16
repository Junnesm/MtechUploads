//
//  Players.swift
//  ScoreKeeperApp
//
//  Created by Ami Smith on 11/8/22.
//

import Foundation

struct Player: Codable, Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.currentScore > rhs.currentScore
    }
    
    var name: String
    var currentScore: Int
}
