import Foundation

class ContentManager {
    private var content: [String: any Content] = [:]
    
    func publish(_ item: some Content) {
        content[item.id] = item
    }
    
    func unpublish(_ id: String) {
        content.removeValue(forKey: id)
    }
    
    func filtered(byTag tag: String) -> [any Content] {
        content.values
            .compactMap({ item in
                item as? (any Content & Taggable)
            })
            .filter ({ $0.tags.contains(tag) })
    }
    
    func getContent(containing query: String) -> [any Content] {
        content.values
            .filter({ $0.matches(query: query )})
    }

    func getContent<T: Content>(of type: T.Type) -> [T] {
        content.values.compactMap({$0 as? T})
    }
}
