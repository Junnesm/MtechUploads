
    import Foundation

    struct Emoji: Codable {
        var symbol: String
        var name: String
        var description: String
        var usage: String
        
        
        static func saveToFile(emojis: [Emoji]) {
            
        }
        
        static func loadFromFile() -> [Emoji]? {
    //        PropertyListDecoder
            guard let dataCheck = try? Data(contentsOf: archiveURL) else { return nil }
            if let emojis = try? JSONDecoder().decode([Emoji].self, from: dataCheck) {
                return emojis
            }
            
            return nil
            
        }
     
        static var archiveURL: URL = documentDirectory.appendingPathComponent("Emojis").appendingPathExtension("plist")
    }

    let documentDirectory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
