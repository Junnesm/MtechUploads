//
//  SwiftUIViewLoadingPopUp.swift
//  CapStoneProject
//
//  Created by Junne Murdock on 3/13/23.
//

import SwiftUI

struct SwiftUIViewJobDescriptionUploadPopUp: View {
    @State private var jobDescriptionUploadTextView = ""
    @State private var savedJobDescriptionUploadText = ""
    @State private var isSaved = false
    
    @State private var keywords: String? //needed for loading animation
    
    var body: some View {
        NavigationView {
            if keywords == nil { //needed for animation
                ProgressView() // needed for animation
            } else { //needed for animation
                VStack {
                    TextEditor(text: $jobDescriptionUploadTextView)
                        .background(Color(red: 218/255, green: 205/255, blue: 205/255))
                    
                    Spacer()
                }
                .navigationTitle("Job Description Upload")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Handle save button tap here
                            savedJobDescriptionUploadText = jobDescriptionUploadTextView
                            isSaved = true
                        }) {
                            Text("Save")
                        }
                    }
                }
                .onDisappear(){
                    if isSaved {
                        
                    }
                }
                .background(NavigationLink(
                    destination: UploadedJobDescriptionViewController(jobDescription: jobDescriptionUploadTextView),
                    isActive: $isSaved
                ) {
                    EmptyView()
                })
            }
            
        }
    }
}

struct SwiftUIViewJobDescriptionUploadPopup_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewJobDescriptionUploadPopUp()
    }
}
struct UploadedJobDescriptionViewController: View {
    let jobDescription: String
    
    var body: some View {
        Text("Job Description: \(jobDescription)")
    }
}
