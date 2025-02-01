import Foundation

protocol Queryable {
    func matches(query: String) -> Bool
}

protocol Taggable {
    var tags: Set<String> { get set }
}

protocol Content: Queryable, Identifiable, Hashable {
    associatedtype ContentType
    var id: String { get }
    var title: String { get set }
    var content: ContentType { get set }
    var publishDate: Date? { get set }
    var lastUpdate: Date? { get set }
    mutating func update(with newContent: ContentType)
}

extension Content {
    mutating func update(with newContent: ContentType) {
        lastUpdate = Date()
        content = newContent
    }
}
