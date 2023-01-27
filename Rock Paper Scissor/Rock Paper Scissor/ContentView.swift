//
//  ContentView.swift
//  Rock Paper Scissor
//
//  Created by Junne Murdock on 1/15/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var emojiChoiceBot = "Lose"
    @State private var emojiChoicePerson = "Win"
    
    @State private var winLoseTie = "Rock, Paper, Scissor"
    
    @State private var choice = ["Rock", "Paper", "Scissor"]
    @State private var holdPersonAnswer = ""
    @State private var holdBotAnswer = ""
    @State private var rpsBot = ["Rock", "Paper", "Scissor"].shuffled()

    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    Text(winLoseTie)
                        .font(.largeTitle.bold())
                    Spacer()
                }
                
                ZStack {
                    Form {
                        Section {
                            Text("Verses: \(holdBotAnswer)")
                            
                        }
                        
                        
                        Section {
                            Picker("", selection: $holdPersonAnswer) {
                                ForEach(choice, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.inline)
                            .labelsHidden()
                        } header: {
                            Text("What it be?")
                        }
                        
                        
                        
                        
                        
                    }
                    Button("Go") {
                        holdBotAnswer = rpsBot.shuffled()[1]
                        win()
                        emoji()
                        emojiBot()
                    }
                    
                }
                ZStack {
                    HStack {
                        Spacer()
                        Text(emojiChoicePerson).font(.system(size: 50))
                        Spacer()
                        Text(emojiChoiceBot).font(.system(size: 50))
                        Spacer()
                    }
                }
            }

        }
    }
    func win () {
        if holdPersonAnswer == holdBotAnswer {
            winLoseTie =  "It's a tie!"
        } else if (holdPersonAnswer == "Rock" && holdBotAnswer == "Scissor") || (holdPersonAnswer == "Scissor" && holdBotAnswer == "Paper") || (holdPersonAnswer == "Paper" && holdBotAnswer == "Rock") {
            winLoseTie =  "You win! 🏆"
        } else {
            winLoseTie =  "You lose 🖕"
        }
        
        }
    
    func emoji() {
        if holdPersonAnswer == "Rock" {
            emojiChoicePerson = "🪨"
        } else if holdPersonAnswer == "Paper" {
            emojiChoicePerson = "📃"
        } else {
            emojiChoicePerson = "✂️"
        }
    }
    
    func emojiBot() {
        if holdBotAnswer == "Rock" {
            emojiChoiceBot = "🪨"
        } else if holdBotAnswer == "Paper" {
            emojiChoiceBot = "📃"
        } else {
            emojiChoiceBot = "✂️"
        }
    }

    
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




































//
//
//if holdPersonAnswer == holdBotAnswer {
//    winLoseTie =  "It's a tie!"
//
//} else if (holdPersonAnswer == "rock" && holdBotAnswer == "scissors") || (holdPersonAnswer == "scissors" && holdBotAnswer == "paper") || (holdPersonAnswer == "paper" && holdBotAnswer == "rock") {
//    winLoseTie =  "You win! 🏆"
//
//} else if holdBotAnswer == holdPersonAnswer {
//        winLoseTie =  "It's a tie!"
//
//    } else if (holdBotAnswer == "rock" && holdPersonAnswer == "scissors") || (holdBotAnswer == "scissors" && holdPersonAnswer == "paper") || (holdBotAnswer == "paper" && holdPersonAnswer == "rock") {
//        winLoseTie =  "You win! 🏆"
//
//    } else {
//        winLoseTie =  "You lose! 🖕"
//
//    }
