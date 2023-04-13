import Foundation
import UIKit

struct Recipe: Codable, Hashable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}

struct CustomRecipe {
    let name: String
    let description: String
    let image: UIImage
    let ingredients: [Ingredient]
}

struct Ingredient {
    let name: String
    let quantity: UInt8
}

