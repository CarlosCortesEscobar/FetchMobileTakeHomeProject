//
//  RecipeViewModel.swift
//  FetchMobileTakeHomeProject
//
//  Created by Carlos Cortes Escobar on 4/29/25.
//

import Foundation

@Observable
class RecipeViewModel {
    var recipes = [RecipeElement]()
    var cuisines = [String]()
    var errorMessage: String?
    
    private let service: RecipeServiceProtocol
    
    init(service: RecipeServiceProtocol) {
        self.service = service
    }
    
    @MainActor
    func fetchAllRecipes() async {
        do {
            self.recipes = try await service.fetchAllRecipes()
            if self.recipes.isEmpty {
                self.errorMessage = RecipeAPIError.emptyDataError.customDescription
                return
            }
            self.cuisines = fetchAllCuisines(self.recipes)
        } catch {
            guard let error = error as? RecipeAPIError else { return }
            self.errorMessage = error.customDescription
        }
    }
    
    func fetchAllCuisines(_ recipes: [RecipeElement]) -> [String] {
        let cuisines =  Array(Set( recipes.map { $0.cuisine })).sorted()
        return cuisines
    }
}
