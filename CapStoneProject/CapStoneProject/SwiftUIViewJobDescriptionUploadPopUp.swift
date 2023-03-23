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

    @State private var isLoading = false
    @State private var extractedKeywords = ""


    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $jobDescriptionUploadTextView)
                    .background(Color(red: 218/255, green: 205/255, blue: 205/255))

                Spacer()
            }
            .navigationTitle("Job Description Upload")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isLoading = true

                        // Simulate a delay to show the loading animation
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            // Handle save button tap here
                            savedJobDescriptionUploadText = jobDescriptionUploadTextView
                            isSaved = true
                            isLoading = false

                            // Call the API here
                            saveButtonTapped()
                        }
                    }) {
                        Text("Save")

                    }
                }
            }


            .background(NavigationLink(
                destination: UploadedJobDescriptionViewController(jobDescription: savedJobDescriptionUploadText, extractedKeywords: extractedKeywords),
                isActive: $isSaved
            ) {
                EmptyView()
            })

            .overlay(
                Group {
                    if isLoading {
                        ProgressView()
                    }
                }
            )
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
    let extractedKeywords: String // add this property to hold the extracted keywords

    var body: some View {
        VStack {
            Text("Job Description: \(jobDescription)")
            Text("Extracted Keywords: \(extractedKeywords)")

            }

        }
    }


//extension SwiftUIViewJobDescriptionUploadPopUp {
//    func saveButtonTapped() {
//        let url = URL(string: "https://api.openai.com/v1/completions")!
//        let domainKey = "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"
//        let headers = ["Content-Type": "application/json",
//                       "Authorization": "Bearer " + domainKey]
//        let data = ["model": "gpt-3.5-turbo",
//                    "prompt": "What are the keywords in this text?",
////                        "temperature": 0.5,
////                        "max_tokens": 50,
////                        "top_p": 1,
////                        "frequency_penalty": 0,
////                        "presence_penalty": 0,
////                        "stop": ["\n"],
////                    "text": jobDescriptionUploadTextView ///NEed to ad in
//        ] as [String : Any]
//
//        let jsonData = try! JSONSerialization.data(withJSONObject: data, options: [])
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.allHTTPHeaderFields = headers
//        request.httpBody = jsonData
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data else {
//                print("Error: \(String(describing: error))")
//                return
//            }
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//                if let choices = json?["choices"] as? [[String: Any]], let text = choices.first?["text"] as? String {
//                    DispatchQueue.main.async {
//                        self.extractedKeywords = text
//                    }
//                } else {
//                    print("Invalid response")
//                }
//            } catch {
//                print("Error decoding response: \(error.localizedDescription)")
//            }
//
//        }.resume()
//    }
//}
//
extension SwiftUIViewJobDescriptionUploadPopUp {
    func saveButtonTapped() {
        let url = URL(string: "https://api.openai.com/v1/completions")!
        let domainKey = "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"
        let headers = ["Content-Type": "application/json",
                       "Authorization": "Bearer " + domainKey]
        let data = ["model": "text-davinci-003",//text-curie-001 USE THIS INSTEAD
                    "prompt": "Extract the keywords from the following job description text:\n\(jobDescriptionUploadTextView)",
                    "max_tokens": 30,
                    "temperature": 0,
                    "n": 1
//                    "stop": ["\n"]
        ] as [String : Any]

        let jsonData = try! JSONSerialization.data(withJSONObject: data, options: [])

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("Error: \(String(describing: error))")
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let choices = json?["choices"] as? [[String: Any]], let text = choices.first?["text"] as? String {
                    DispatchQueue.main.async {
                        self.extractedKeywords = text
                    }
                } else {
                    print("Invalid response")
                }
            } catch {
                print("Error decoding response: \(error.localizedDescription)")
            }

        }.resume()
    }
}
//struct SwiftUIViewJobDescriptionUploadPopUp: View {
//    @State private var result: String = ""
//
//    func fetchData() {
//        let apiKey = "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"
//        let urlString = "https://api.openai.com/v1/engines/text-davinci-002/completions"
//        let prompt = "Extract keywords from this text."
//        let jobDescription = "Some text here."
//        let parameters = """
//            {
//                "model": "text-davinci-002",
//                "prompt": "\(prompt) \(jobDescription)",
//                "temperature": 0.5,
//                "max_tokens": 60,
//                "top_p": 1.0,
//                "frequency_penalty": 0.8,
//                "presence_penalty": 0.0
//            }
//            """
//
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = parameters.data(using: .utf8)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//
//            guard let data = data else {
//                print("Invalid response data")
//                return
//            }
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//                if let choices = json?["choices"] as? [[String: Any]], let text = choices.first?["text"] as? String {
//                    DispatchQueue.main.async {
//                        self.result = text
//                    }
//                } else {
//                    print("Invalid response data")
//                }
//            } catch {
//                print("Error: \(error.localizedDescription)")
//            }
//        }.resume()
//    }
//
//    var body: some View {
//        VStack {
//            Text("Extract Keywords")
//                .font(.title)
//                .padding()
//
//            Button(action: fetchData) {
//                Text("Generate")
//            }
//            .padding()
//
//            Text(result)
//                .padding()
//        }
//    }
//}
