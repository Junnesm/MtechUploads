//
//  LinkedInAPI.swift
//  CapStoneProject
//
//  Created by Junne Murdock on 3/8/23.
//


import Foundation



class ChatGptAPI {
    
    let fileUrl = URL(string: "https://api.openai.com/v1/files/{file_id}/content")
    let apiKey = "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"
    //
    //        var request = URLRequest(url: fileUrl)
    //        request.httpMethod = "GET"
    //        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    //
    //        let session = URLSession.shared
    //        let task = session.dataTask(with: request) { data, response, error in
    //            if let error = error {
    //                print("Error: \(error.localizedDescription)")
    //            } else if let httpResponse = response as? HTTPURLResponse,
    //                      (200..<300).contains(httpResponse.statusCode),
    //                      let data = data {
    //                // handle the response data here
    //            } else {
    //                print("Error: Unexpected response \(response?.description ?? "")")
    //            }
    //        }
    //
    //        task.resume()
    //    }
    //
}
