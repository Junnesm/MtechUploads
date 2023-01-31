//
//  ContentView.swift
//  edutainment
//
//  Created on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var multiplicationChoice = 2
    @State private var multiplicationNumbers = 2..<21
    
    
    @State private var keepTrackOfQuestions = 1
    
    @State private var title = "Math Game"
    
    
    @State private var scoreKeeper = 0
    
    @State private var holdScoreKeeper = ""
    
    @State private var hideLockTableSelections = false
    
    @State private var buttonPushed = false
    
    @State private var holdMath = ""
    
    @State private var holdData = ""
    
    @State private var questionAmount = "5"
    @State private var numberOfquestions = ["5", "10", "20"]
    
    @State private var numberGoesUpQuestion = 2
    
    var body: some View {
        NavigationView {
            ZStack {
                
                
                HStack (alignment: .center, spacing: 10){
                    Section {
                        Text(holdMath)
                            .opacity(hideLockTableSelections ? 1 : 0)
                        
                        
                        TextField("answer here", text: $holdData)
                            .opacity(hideLockTableSelections ? 1 : 0)
                        
                        Button ("Enter") {
                            buttonPushed = true
                            
                            if buttonPushed == true {
                                math()
                                buttonPushed = false
                                    
                                
                            }
                        }
                        .opacity(hideLockTableSelections ? 1 : 0)
                        
//                        .toolbar {
//
//                            ToolbarItem(placement: .principal) {
//                                Text(title)
//                                    .font(.largeTitle.bold())
//                                    .accessibilityAddTraits(.isHeader)
//
//                            }
//
//                        }
                        
                    }
                    
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                VStack {
                    Text(title).font(.largeTitle).bold()
                    Picker("Choose multiplication", selection: $multiplicationChoice) {
                        ForEach(multiplicationNumbers, id: \.self) {
                            Text("\($0)")
                            
                        }
                        .opacity(hideLockTableSelections ? 0 : 1)
                        
                    }
                    
                    
                    .pickerStyle(.wheel)
                    Picker("Questions", selection:$questionAmount) {
                        ForEach(numberOfquestions, id: \.self) {
                            Text("\($0) questions")
                                .opacity(hideLockTableSelections ? 0 : 1)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                    .opacity(hideLockTableSelections ? 0 : 1)
                    
                    Text("Score: \(scoreKeeper)")
                        .opacity(hideLockTableSelections ? 1 : 0)
                    
                    Button("Math") {
                        settings()
                        math()
                    }
                    .disabled(hideLockTableSelections ? true : false)
                    .frame(width: 50, height: 25)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(.orange), Color(.systemPink), Color(.red)]), startPoint: .top, endPoint: .bottom)
                    )
                    .clipShape(Rectangle())
                    .font(.system(size: 20))
                    .fontWidth(.compressed)
                    .border(.mint)
                    .buttonBorderShape(.roundedRectangle)
                    .opacity(hideLockTableSelections ? 0 : 1)
                    
                    Spacer()
                }
            }
        }
    }
    
    func settings() {
        
        
        switch multiplicationChoice {
        case 2:
            switch questionAmount {
            case "5":
                hideLockTableSelections.toggle()
            case "10":
                hideLockTableSelections.toggle()
            case "20":
                hideLockTableSelections.toggle()
            default:
                print("error has occured. \(questionAmount) may not have right value.")
            }
        case 3:
            switch questionAmount {
            case "5":
                hideLockTableSelections.toggle()
            case "10":
                hideLockTableSelections.toggle()
            case "20":
                hideLockTableSelections.toggle()
            default:
                print("error has occured. \(questionAmount) may not have right value.")
            }
        case 4:
            switch questionAmount {
            case "5":
                hideLockTableSelections.toggle()
            case "10":
                hideLockTableSelections.toggle()
            case "20":
                hideLockTableSelections.toggle()
            default:
                print("error has occured. \(questionAmount) may not have right value.")
            }
        case 5:
            switch questionAmount {
            case "5":
                hideLockTableSelections.toggle()
            case "10":
                hideLockTableSelections.toggle()
            case "20":
                hideLockTableSelections.toggle()
            default:
                print("error has occured. \(questionAmount) may not have right value.")
            }
        case 6:
            switch questionAmount {
            case "5":
                hideLockTableSelections.toggle()
            case "10":
                hideLockTableSelections.toggle()
            case "20":
                hideLockTableSelections.toggle()
            default:
                print("error has occured. \(questionAmount) may not have right value.")
            }
        case 7:
            switch questionAmount {
            case "5":
                hideLockTableSelections.toggle()
            case "10":
                hideLockTableSelections.toggle()
            case "20":
                hideLockTableSelections.toggle()
            default:
                print("error has occured. \(questionAmount) may not have right value.")
            }
        case 8:
            switch questionAmount {
            case "5":
                hideLockTableSelections.toggle()
            case "10":
                hideLockTableSelections.toggle()
            case "20":
                hideLockTableSelections.toggle()
            default:
                print("error has occured. \(questionAmount) may not have right value.")
            }
            switch questionAmount {
            case "5":
                hideLockTableSelections.toggle()
            case "10":
                hideLockTableSelections.toggle()
            case "20":
                hideLockTableSelections.toggle()
            default:
                print("error has occured. \(questionAmount) may not have right value.")
            }
        case 10:
            switch questionAmount {
            case "5":
                hideLockTableSelections.toggle()
            case "10":
                hideLockTableSelections.toggle()
            case "20":
                hideLockTableSelections.toggle()
            default:
                print("error has occured. \(questionAmount) may not have right value.")
            }
        case 11:
            switch questionAmount {
            case "5":
                hideLockTableSelections.toggle()
            case "10":
                hideLockTableSelections.toggle()
            case "20":
                hideLockTableSelections.toggle()
            default:
                print("error has occured. \(questionAmount) may not have right value.")
            }
        case 12:
            switch questionAmount {
            case "5":
                hideLockTableSelections.toggle()
            case "10":
                hideLockTableSelections.toggle()
            case "20":
                hideLockTableSelections.toggle()
            default:
                print("error has occured. \(questionAmount) may not have right value.")
        
        }
    case 13:
        switch questionAmount {
        case "5":
            hideLockTableSelections.toggle()
        case "10":
            hideLockTableSelections.toggle()
        case "20":
            hideLockTableSelections.toggle()
        default:
            print("error has occured. \(questionAmount) may not have right value.")
    }
case 14:
    switch questionAmount {
    case "5":
        hideLockTableSelections.toggle()
    case "10":
        hideLockTableSelections.toggle()
    case "20":
        hideLockTableSelections.toggle()
    default:
        print("error has occured. \(questionAmount) may not have right value.")
}

case 15:
    switch questionAmount {
    case "5":
        hideLockTableSelections.toggle()
    case "10":
        hideLockTableSelections.toggle()
    case "20":
        hideLockTableSelections.toggle()
    default:
        print("error has occured. \(questionAmount) may not have right value.")
}

case 16:
    switch questionAmount {
    case "5":
        hideLockTableSelections.toggle()
    case "10":
        hideLockTableSelections.toggle()
    case "20":
        hideLockTableSelections.toggle()
    default:
        print("error has occured. \(questionAmount) may not have right value.")
}

case 17:
    switch questionAmount {
    case "5":
        hideLockTableSelections.toggle()
    case "10":
        hideLockTableSelections.toggle()
    case "20":
        hideLockTableSelections.toggle()
    default:
        print("error has occured. \(questionAmount) may not have right value.")
}

case 18:
    switch questionAmount {
    case "5":
        hideLockTableSelections.toggle()
    case "10":
        hideLockTableSelections.toggle()
    case "20":
        hideLockTableSelections.toggle()
    default:
        print("error has occured. \(questionAmount) may not have right value.")
}
case 19:
    switch questionAmount {
    case "5":
        hideLockTableSelections.toggle()
    case "10":
        hideLockTableSelections.toggle()
    case "20":
        hideLockTableSelections.toggle()
    default:
        print("error has occured. \(questionAmount) may not have right value.")
    }
case 20:
    switch questionAmount {
    case "5":
        hideLockTableSelections.toggle()
    case "10":
        hideLockTableSelections.toggle()
    case "20":
        hideLockTableSelections.toggle()
    default:
        print("error has occured. \(questionAmount) may not have right value.")
    }
default:
    print("Error occured. unable to recognize number")
}


    }
    func math() {
        switch multiplicationChoice {
        case 2:
            checkForQuestions()
        case 3:
            checkForQuestions()
        case 4:
            checkForQuestions()
        case 5:
            checkForQuestions()
        case 6:
            checkForQuestions()
        case 7:
            checkForQuestions()
        case 8:
            checkForQuestions()
        case 9:
            checkForQuestions()
        case 10:
            checkForQuestions()
        case 11:
            checkForQuestions()
        case 12:
            checkForQuestions()
        default:
            checkForQuestions()
        }
        
    }
    
    
    func holdingData() {
        
        let multiplication = (multiplicationChoice * numberGoesUpQuestion)
        
        
        
        if holdMath.isEmpty {
            holdMath = ("\(multiplicationChoice) X \(numberGoesUpQuestion) = ")
            
        } else if Int(multiplication) == Int(holdData) {
            title = "Win"
            scoreKeeper += 1
            numberGoesUpQuestion += 1
            holdData = ""
            keepTrackOfQuestions += 1
        } else if keepTrackOfQuestions == Int(questionAmount) {
            title = ("score = \(numberGoesUpQuestion)")
        } else if keepTrackOfQuestions != Int(questionAmount){
            title = "Wrong"
            holdData = ""
            keepTrackOfQuestions += 1
            numberGoesUpQuestion += 1
        }
        holdMath = ("\(multiplicationChoice) X \(numberGoesUpQuestion) = ")
        
    }
    func checkForQuestions() {
        if questionAmount !=  String(keepTrackOfQuestions) {
            
            holdingData()
        } else {
            title = "Play Again?"
            hideLockTableSelections.toggle()
            holdMath = ""
            numberGoesUpQuestion = 2
            holdData = ""
            keepTrackOfQuestions = 1
            scoreKeeper = 0
            
            return
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






















