//
//  LinkedInAPI.swift
//  CapStoneProject
//
//  Created by Junne Murdock on 3/8/23.
//


import SwiftUI
import Foundation
import OpenAIKit



//struct ChatGPT: Encodable {
//    var model: [String: String]
//    var messages: [String: String] = [:]
//
//    struct ChatGPTAPI: View {
//
//        @State private var responseText: String = ""
//        @State private var jobDescriptionUploadTextView = ""
//
//        var body: some View {
//            VStack {
//                Text(responseText)
//                    .padding()
//                Button("Make API Call") {
//                    makeAPICall(jobDescription: jobDescriptionUploadTextView)
//                }
//            }
//        }
//
//        func makeAPICall(jobDescription: String) {
//            let url = URL(string: "https://api.openai.com/v1/chat/completions")!
//            let headers = ["Content-Type": "application/json"]
//            let data = ["model": "gpt-3.5-turbo",
//                        "messages": ["role": "user", "content": jobDescription]
//            ] as [String : Any]
//            //
//            let jsonData = try! JSONSerialization.data(withJSONObject: data, options: [])
//
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.allHTTPHeaderFields = headers
//            request.httpBody = jsonData
//
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
//                guard let data = data else {
//                    print("Error: \(String(describing: error))")
//                    return
//                }
//
//                if let responseText = String(data: data, encoding: .utf8) {
//                    DispatchQueue.main.async {
//                        self.responseText = responseText
//                    }
//                } else {
//                    print("Invalid response")
//                }
//            }.resume()
//        }
//    }
//}


//
//
//struct ChatGPTAPI: View {
//
//    @State private var responseText: String = ""
//
//
//    var body: some View {
//        VStack {
//            Text(responseText)
//                .padding()
//            Button("Make API Call") {
//                makeAPICall()
//            }
//        }
//    }
//
//    func makeAPICall() {
//        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
//        let headers = ["Content-Type": "application/json"]
//        let data = ["model": "gpt-3.5-turbo",
//                    "messages": ["role": "user", "content": "pull out the key words of this job description"]
//        ] as [String : Any]
////
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
//            if let responseText = String(data: data, encoding: .utf8) {
//                DispatchQueue.main.async {
//                    self.responseText = responseText
//                }
//            } else {
//                print("Invalid response")
//            }
//        }.resume()
//    }
//}
//}
struct ChatGPT: Encodable {
    var model: [String: String]
    var messages: [String: String] = [:]

    struct ChatGPTAPI: View {
        
        @State private var responseText: String = ""
        @State private var jobDescriptionUploadTextView = ""
        
        var body: some View {
            VStack {
                Text(responseText)
                    .padding()
                Button("Get Keywords") {
                    makeAPICall(jobDescription: jobDescriptionUploadTextView)
                }
            }
        }
        
        func makeAPICall(jobDescription: String) {
            let url = URL(string: "https://api.openai.com/v1/completions")!
            let domainKey = "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"
            let headers = ["Content-Type": "application/json",
                           "Authorization": "Bearer" + domainKey]
            let data = ["model": "text-davinci-003",
                        "prompt": "What are the keywords in this text?",
                        "text": jobDescription
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
                            self.responseText = text
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
}
