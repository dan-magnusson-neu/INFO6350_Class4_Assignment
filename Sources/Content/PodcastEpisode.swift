import Foundation

class PodcastEpisode: Content, Taggable {
    typealias ContentType = URL
    
    var id: String
    var title: String
    var content: URL

    var tags: Set<String>

    var lengthInSeconds: Int
    var publishDate: Date? = nil
    var lastUpdate: Date? = nil
    
    init(id: String, title: String, content: URL, tags: Set<String>, lengthInSeconds: Int) {
        self.id = id
        self.title = title
        self.content = content
        self.tags = tags
        self.lengthInSeconds = lengthInSeconds
    }
    
    func matches(query: String) -> Bool {
        return content.absoluteString.contains(query)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: PodcastEpisode, rhs: PodcastEpisode) -> Bool {
        lhs.id == rhs.id
    }
}


