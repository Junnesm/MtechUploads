//
//  StoreItem .swift
//  iTunesSearch
//
//  Created by Junne Murdock on 12/2/22.
//

import Foundation
struct StoreItem: Codable {
    let artistName: String
    let albumName: String
    let songTitle: String
    var description: String

    
    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case albumName = "collectionName"
        case songTitle = "trackName"
        case description = "longDescription"
        
    }
    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        artistName = try values.decode(String.self, forKey: CodingKeys.artistName)
        albumName = try values.decode(String.self, forKey: CodingKeys.albumName)
        songTitle = try values.decode(String.self, forKey: CodingKeys.songTitle)
        
        if let description = try? values.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
        }
    }
}
struct SearchResponse: Codable {
    let results: [StoreItem]
}
