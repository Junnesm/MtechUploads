import UIKit


func binaryToDecimal(binary: String) -> Int? {
    var result: Int = 0

    for digit in binary {
        switch(digit) {
            case "0": result = result * 2
            case "1": result = result * 2 + 1
            default: return nil
        }
    }
    return result
}



extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try?
                JSONSerialization.jsonObject(with: self,options: []),
            let jsonData = try?
                JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData, encoding: .utf8) else {
            print("Failed to read JSON Object.")
            return
        }
        print(prettyJSONString)
    }
}
var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
urlComponents.queryItems = [
    "term": "Apple",
    "limit": "10",
    "media": "music",
    "attribute": "mixTerm"
    
].map { URLQueryItem(name: $0.key, value: $0.value) }

Task {
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    
    if let httpResponse = response as? HTTPURLResponse,
       httpResponse.statusCode == 200 {
        data.prettyPrintedJSONString()
        
    }
}
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

enum StoreItemError: Error, LocalizedError {
    case itemsNotFound
}

func fetchItems(matching query: [String: String]) async
   throws -> [StoreItem] {
    var urlComponents = URLComponents(string:
       "https://itunes.apple.com/search")!
    urlComponents.queryItems = query.map { URLQueryItem(name: $0.key,
       value: $0.value) }
    let (data, response) = try await URLSession.shared.data(from:
       urlComponents.url!)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw StoreItemError.itemsNotFound
        }
       
    let decoder = JSONDecoder()
    let searchResponse = try decoder.decode(SearchResponse.self,
       from: data)
    return searchResponse.results
}

let query = [
"term": "Apple",
"limit": "10",
"media": "music",
"attribute": "mixTerm"
]

Task {
    do {
        let storeItems = try await fetchItems(matching: query)
        storeItems.forEach { item in
            print("""
            Name: \(item.songTitle)
            Artist: \(item.artistName)
            Album: \(item.albumName)
            Description: \(item.description)
            
            """)
        }
    } catch {
        print(error)
    }
}




















