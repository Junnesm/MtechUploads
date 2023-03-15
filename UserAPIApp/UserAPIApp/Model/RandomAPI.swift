//
//  DisplayUserController.swift
//  UserAPIApp
//
//  Created by Junne Murdock on 3/6/23.
//

import Foundation
import UIKit




class RandomAPI {
    enum GetError: Error, LocalizedError {
        case failedToLoadData
    }
    
    class RandomAPIController {
        
        func fetchRandomUser(userAmount: Int, _ searchParameters: [String]) async throws -> Response {
            let url = URL(string: "https://randomuser.me/api?inc=name,picture,\(searchParameters.joined(separator: ","))&results=\(userAmount)")
            
            let (data, response) = try await URLSession.shared.data(from: url!)
            print(String(data: data, encoding: .utf8)!)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw RandomAPIController.RandomApiError.userNotFound
            }
            
            let jsonDecoder = JSONDecoder()
            let person = try jsonDecoder.decode(Response.self, from: data)
            print(person)
            return person
            
        }
        
        
        func randomImage(from url: URL) async throws -> UIImage {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw RandomAPIController.RandomApiError.userNotFound
            }
            
            guard let image = UIImage(data: data) else {
                throw RandomAPIController.RandomApiError.userNotFound
            }
            
            return image
        }
        
        enum RandomApiError: Error, LocalizedError {
            case userNotFound
            
        }
    }
}







