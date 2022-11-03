//
//  Posts.swift
//  TechSocialMediaApp
//
//  Created by Junne Murdock on 11/2/22.
//

import Foundation
import UIKit

struct PostInfo {
    var userName: String
    var postBody: String
    var date: Date
    
    static let allPosts: [PostInfo] = [
        PostInfo(userName: "@Junne", postBody: "I am tired", date: Date.init(timeIntervalSince1970: 23434)),
        PostInfo(userName: "@Ami", postBody: "Let's do a movie night!", date: Date.init(timeIntervalSince1970: 2345)),
        PostInfo(userName: "@Junne", postBody: "Nelson's beard is way too cool", date: Date.init(timeIntervalSince1970: 2345)),
        PostInfo(userName: "@Junne", postBody: "Ami really rocks sweaters", date: Date.init(timeIntervalSince1970: 12345)),
        PostInfo(userName: "@Junne", postBody: "I love cats", date: Date.init(timeIntervalSince1970: 2345)),
        PostInfo(userName: "@Ryan", postBody: "Juuunne makes me want to quit my job", date: Date.init(timeIntervalSince1970: 213456)),
        PostInfo(userName: "@Junne", postBody: "Coding is like yeah", date: Date.init(timeIntervalSince1970: 23456)),
        PostInfo(userName: "@Junne", postBody: "bro, can you even?", date: Date.init(timeIntervalSince1970: 2343)),
        PostInfo(userName: "@Nelson", postBody: "My wife is hot", date: Date.init(timeIntervalSince1970: 123456)),
        PostInfo(userName: "@Junne", postBody: "winter is here", date: Date.init(timeIntervalSince1970: 234567))
        
        
        
    ]
    
    
}
