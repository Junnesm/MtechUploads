//
//  ContentView.swift
//  CapStoneProject
//
//  Created by Junne Murdock on 3/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var firstText = ""
    @State private var secondText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Job Description")
                TextField("Enter first text", text: $firstText)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading) {
                Text("Resume")
                TextField("Enter second text", text: $secondText)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

