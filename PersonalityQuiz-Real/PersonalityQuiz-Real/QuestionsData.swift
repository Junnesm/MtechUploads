//
//  QuestionsData.swift
//  PersonalityQuiz
//
//  Created by Junne Murdock on 10/5/22.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
    
}
enum ResponseType{
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
    
}
enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You enjoy spending time with those you love and doing fun activities."
        case .cat:
            return "You are mischievous yet mild-tempered. You march to the beat of your own drum!"
        case .rabbit:
            return "You love everythign that is soft. you are very sweet!"
        case .turtle:
            return "You are wise beyond your years. You pay attention to details. Slow and steady wins the race!"
        }
    }
}




