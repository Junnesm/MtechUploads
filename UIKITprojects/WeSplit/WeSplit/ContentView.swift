//
//  ContentView.swift
//  WeSplit
//
//  Created by Junne Murdock on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountisFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountisFocused)
                    
                    Picker("Number of people", selection:  $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentaage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                        
                    Button("Done") {
                        amountisFocused = false
                    }
                }
            }
        }
//  @State private var tapCount = 0
//  @State private var name = ""
//  @State private var snack = ""
//  let students = ["Nelts", "Ami", "Junne"]
//  @State private var selectedStudent = "Harry"
//
//  var body: some View {
//
//      NavigationView {
//        Form {
//          SubView(name: $name)
//          Section {
//            TextField("Enter your name", text: $name)
//            TextField("Favorite snack", text: $snack)
//            Text("Your name is \(name)")
//            Text("You look like a snack :smirk: jk my favorite snack is \(snack)")
//            Text("Hello, world!")
//            Text("Hello, world!")
//              Text("Hello, world!")
//              .navigationTitle("SwiftUI")
//              .navigationBarTitleDisplayMode(.inline)
//          }
//          Section {
//              Text("Hello, world!")
//              Text("Hello, world!")
//              Text("Hello, world!")
//
//          }
//          Section {
//              Text("Hello, world!")
//              Text("Hello, world!")
//              Text("Hello, world!")
//            ForEach(0..<100) {
//              Text("Row \($0)")
//            }
//          }
//          Section {
//            Picker("Select your singer", selection: $selectedStudent) {
//              ForEach(students, id: \.self) {
//                Text($0)
//              }
//              Text(name)
//            }
//            Button("Tap Count: \(tapCount)") {
//              tapCount += 1
//            }
//        }
//      }
//    }
//  }
//}
//struct SubView: View {
//  @Binding var name: String
//  var body: some View {
//    TextField("Enter your name", text: $name)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}












