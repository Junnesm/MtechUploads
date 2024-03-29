//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Junne Murdock on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var moves = ["Rock", "Paper", "Scissors"]
    @State private var winningChoice = Int.random(in: 0...2)
    
    var body: some View {
//        ZStack {
//            RadialGradient(stops: [
//                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
//                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
//            ], center: .top, startRadius: 200, endRadius: 700)
//            .ignoresSafeArea()
//
      
            VStack (spacing: 15) {
                VStack {
                    Text("ROCK PAPER SCISSORS")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    Text(moves[winningChoice])
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        choiceTapped(number)
                    } label: {
                        Text(moves[number])
                        
                    }
                }
                
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
            
            
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: makeYourMove)
            } message: {
                Text("Your score is \(score)")
            }
        }
        

        func choiceTapped(_ number: Int) {
            if number == winningChoice {
                scoreTitle = "Correct"
                score += 1
            } else {
                scoreTitle = "Wrong"
            }
            showingScore = true
        }
        
        func makeYourMove() {
            moves.shuffled()[1]
//            winningChoice = Int.random(in: 0...2)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    


