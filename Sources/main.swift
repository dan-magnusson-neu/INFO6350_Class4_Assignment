import Foundation

let post1 = BlogPost(id: "BlogPost1", title: "Generics and You", content: "I've often wondered if generics types are related to generals, metaphorically...", tags: ["swift", "generics"])
let post2 = BlogPost(id: "BlogPost2", title: "Using Protocols", content: "Protocols are a powerful tool in the arsenal of a swift developer...", tags: ["swift", "protocols"])
let episode1 = PodcastEpisode(id: "PodcastEpisode1", title: "Ep1 - Boxed Types",
                              content: URL(fileURLWithPath: "/MyFiles/Ep1-BoxedTypes.mp3"),
                              tags: ["swift", "protocols", "any"],
                              lengthInSeconds: 5000)
let episode2 = PodcastEpisode(id: "PodcastEpisode2", title: "Ep2 - Type Erasure",
                              content: URL(fileURLWithPath: "/MyFiles/Ep2-TypeErasure.mp3"),
                              tags: ["swift", "type", "protocols", "generics"],
                              lengthInSeconds: 5000)
let manager = ContentManager()
manager.publish(post1)
manager.publish(post2)
manager.publish(episode1)
manager.publish(episode2)

print(manager.getContent(containing: "Type").map(\.title))
print(manager.filtered(byTag: "generics").map(\.title))
print(manager.getContent(of: BlogPost.self).map(\.title))

manager.unpublish(episode2.id)
print("Removing Episode 2...")

print(manager.getContent(containing: "Type").map(\.title))
