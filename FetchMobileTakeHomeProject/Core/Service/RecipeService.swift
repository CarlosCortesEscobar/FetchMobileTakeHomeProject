//
//  RecipeService.swift
//  FetchMobileTakeHomeProject
//
//  Created by Carlos Cortes Escobar on 4/29/25.
//

import Foundation

protocol RecipeServiceProtocol {
    func fetchAllRecipes() async throws -> [RecipeElement]
}

class RecipeService: HTTPDataDownloader, RecipeServiceProtocol {
    
    init() {}
    
    // Would use baseURLComponent constructors if there were more endpoints and consistent url paths
    private let allRecipesURLString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    private let malformedDataURLString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    private let emptyDataURLString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    
    func fetchAllRecipes() async throws -> [RecipeElement] {
        return try await fetchData(as: Recipe.self, endpoint: allRecipesURLString).recipes
    }
    
}
