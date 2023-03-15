//
//  LinkedInAPI.swift
//  CapStoneProject
//
//  Created by Junne Murdock on 3/8/23.
//


import Foundation




class APILayer {
    func apiLayer () {
        var semaphore = DispatchSemaphore (value: 0)
        
        let url = "https://api.apilayer.com/skills?q={q}"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("ut1QfDzzHdxBjNtDKDAz3mHededqew5M", forHTTPHeaderField: "apikey")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
    }
}
