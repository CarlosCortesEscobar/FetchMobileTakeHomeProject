//
//  MockRecipeService.swift
//  FetchMobileTakeHomeProject
//
//  Created by Carlos Cortes Escobar on 4/29/25.
//

import Foundation

class MockRecipeService: RecipeServiceProtocol {
    
    var mockData: Data?
    var mockError: RecipeAPIError?
    
    func fetchAllRecipes() async throws -> [RecipeElement] {
        do {
            let recipeRoot = try JSONDecoder().decode(Recipe.self, from: (mockData ?? mockValidRecipeData)!)
            return recipeRoot.recipes
        } catch {
            print("DEBUG: \(error.localizedDescription)")
            throw RecipeAPIError.jsonParsingError
        }
    }
    
    
}
