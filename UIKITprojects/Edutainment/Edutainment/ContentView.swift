//
//  ContentView.swift
//  Edutainment
//
//  Created by Junne Murdock on 1/19/23.
//

import SwiftUI




struct ContentView: View {
    
    @State private var testingStepper = 2
    @State private var numberOfQuestion = ["5", "10", "20"]
    @State private var questionAmount = "5"
    
    
    
    var body: some View {
        VStack {
           
            Picker("Times by", selection: $testingStepper) {
                ForEach(2..<13) {
                    Text("\($0)")
                }
            }
            .pickerStyle(.wheel)
            Picker("Questions", selection: $testingStepper) {
                ForEach(numberOfQuestion, id: \.self) {
                    Text("\($0) questions")
                }
            }
            .pickerStyle(.segmented)
            
            
            
            Button("Math") {
                    letsPlayTapped()
            }
            .frame(width: 100, height: 50)
            .background(.black)
            .foregroundColor(.pink)
            .clipShape(Rectangle())
            .font(.system(size: 30))
        }
        .padding()
        

}

        }
        func letsPlayTapped() {
            print("hey")
            return
        }

    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

