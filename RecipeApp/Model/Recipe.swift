import Foundation
import UIKit

struct Recipe: Codable, Hashable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}

struct CustomRecipe {
    
    var name: String?
    var description: String?
    var image: UIImage?
    var ingredients: [Ingredient]?
}

struct Ingredient {
    var name: String?
    var quantity: String?
}

