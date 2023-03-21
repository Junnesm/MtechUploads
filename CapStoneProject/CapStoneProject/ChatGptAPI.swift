//
//  LinkedInAPI.swift
//  CapStoneProject
//
//  Created by Junne Murdock on 3/8/23.
//


import SwiftUI
import Foundation
import OpenAIKit

//
//class ChatGptAPI {
//    struct JobDescriptionBody{
//        var model = "gpt-3.5-turbo",
//        var messages = String
//
//    }
//
//
//
//    let fileUrl = URL(string: "https://api.openai.com/v1/chat/completions")
//    let apiKey = "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"
//
//    func getFileContent() {
//            var request = URLRequest(url: fileUrl!)
//            request.httpMethod = "GET"
//
//            let authHeaderValue = "Bearer \(apiKey)"
//            request.addValue(authHeaderValue, forHTTPHeaderField: "Authorization")
//
//            let session = URLSession.shared
//            let task = session.dataTask(with: request) { data, response, error in
//                if let error = error {
//                    print("Error: \(error.localizedDescription)")
//                } else if let httpResponse = response as? HTTPURLResponse,
//                          (200..<300).contains(httpResponse.statusCode),
//                          let data = data {
//                    // handle the response data here
//                } else {
//                    print("Error: Unexpected response \(response?.description ?? "")")
//                }
//            }
//            task.resume()
//        }
//    }
import SwiftUI

struct ChatGPT {
    var model: [String: String]
    var messages: [String: String] = [:]


struct ChatGPTAPI: View {
    
    @State private var responseText: String = ""
   
    
    var body: some View {
        VStack {
            Text(responseText)
                .padding()
            Button("Make API Call") {
                makeAPICall()
            }
        }
    }
    
    func makeAPICall() {
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        let headers = ["Content-Type": "application/json"]
        let data = ["model": "gpt-3.5-turbo",
                    "messages": ["role": "user", "content": "Hello!"]
        ] as [String : Any]
//        let data = ["model": "text-davinci-002",
//                        "prompt": "Hello!",
//                        "temperature": 0.5,
//                        "max_tokens": 50,
//                        "stop": ["\n"]
//        ]as [String : Any]
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
            
            if let responseText = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.responseText = responseText
                }
            } else {
                print("Invalid response")
            }
        }.resume()
    }
}
}
