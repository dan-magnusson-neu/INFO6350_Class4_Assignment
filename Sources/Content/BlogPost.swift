import Foundation


struct BlogPost: Content, Taggable {
    typealias ContentType = String
    
    let id: String
    var title: String
    var content: String
    var tags: Set<String>
    var publishDate: Date?
    var lastUpdate: Date?
    
    func matches(query: String) -> Bool {
        return content.contains(query)
    }
}
