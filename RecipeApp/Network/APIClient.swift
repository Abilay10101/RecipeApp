//
//  APIClient.swift
//  RecipeApp
//
//  Created by Vladimir on 14.03.2023.
//

import Foundation

final class APIClient {
    static let shared = APIClient()
    private init() {}
    
    func getRecipes() -> [RecipeStruct] {
        Bundle.main.decode([RecipeStruct].self, from: "Recipes.json")
    }
}
