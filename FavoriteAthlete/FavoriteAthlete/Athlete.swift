//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Junne Murdock on 11/10/22.
//

import Foundation

struct Athlete {
    var name: String
    var age: String
    var league: String
    var team: String
    
    
}

extension Athlete: CustomStringConvertible {
    var description: String {
        return "\(name) is \(age) years old and they play for the \(team) in the \(league)."
    }
}
