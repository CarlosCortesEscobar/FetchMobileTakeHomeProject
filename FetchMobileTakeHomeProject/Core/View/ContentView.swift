//
//  ContentView.swift
//  FetchMobileTakeHomeProject
//
//  Created by Carlos Cortes Escobar on 4/29/25.
//

import SwiftUI

struct ContentView: View {
    private let service: RecipeServiceProtocol
    @State var viewModel : RecipeViewModel
    init(service: RecipeServiceProtocol) {
        self.service = service
        self._viewModel = State(wrappedValue: RecipeViewModel(service: service))
    }

    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewModel.cuisines, id: \.self) { cuisine in
                Section(cuisine) {
                    let recipes = getRecipesForCuisine(cuisine)
                    ForEach(recipes) { recipe in
                        NavigationLink(value: recipe) {
                            HStack {
                                ImageView(url: recipe.photoURLSmall)
                                    .frame(width: 32, height: 32, alignment: .trailing)
                                Text(recipe.name)
                                    .font(.subheadline)
                                    }
                                }
                            }
                        }
                    }
                }
                .overlay {
                    if let error = viewModel.errorMessage {
                        Text("Error: \(error)")
                    }
                }
                .navigationDestination(for: RecipeElement.self, destination: { recipe in
                    RecipeDetailsView(recipe: recipe)
                })
            }
            .task {
                await viewModel.fetchAllRecipes()
            }
            .refreshable {
                await viewModel.fetchAllRecipes()
            }
        }
        
        func getRecipesForCuisine(_ cuisine: String) -> [RecipeElement] {
            return viewModel.recipes.filter { $0.cuisine == cuisine}
        }
    }


#Preview {
    ContentView(service: MockRecipeService())
}

