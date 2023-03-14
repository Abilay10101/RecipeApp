import Foundation

struct Recipe: Codable, Hashable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}

