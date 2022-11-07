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
    var date: String
    
    static let allPosts: [PostInfo] = [
        PostInfo(userName: "@Junne", postBody: "I am tired", date: "March 24, 1986"),
        PostInfo(userName: "@Ami", postBody: "Let's do a movie night!", date: "March 24, 1986"),
        PostInfo(userName: "@Junne", postBody: "Nelson's beard is way too cool", date: "March 24, 1986"),
        PostInfo(userName: "@Junne", postBody: "Ami really rocks sweaters", date: "March 24, 1986"),
        PostInfo(userName: "@Junne", postBody: "I love cats", date: "March 24, 1986"),
        PostInfo(userName: "@Ryan", postBody: "Juuunne makes me want to quit my job", date: "March 24, 1986"),
        PostInfo(userName: "@Junne", postBody: "Coding is like yeah", date: "March 24, 1986"),
        PostInfo(userName: "@Junne", postBody: "bro, can you even?", date: "March 24, 1986"),
        PostInfo(userName: "@Nelson", postBody: "My wife is hot", date: "March 24, 1986"),
        PostInfo(userName: "@Junne", postBody: "winter is here", date: "March 24, 1986")
        
        
        
    ]
    
    
}
