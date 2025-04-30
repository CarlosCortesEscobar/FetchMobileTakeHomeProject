//
//  RecipeDetailsView.swift
//  FetchMobileTakeHomeProject
//
//  Created by Carlos Cortes Escobar on 4/29/25.
//

import SwiftUI
import WebKit

struct RecipeDetailsView: View {
    let recipe: RecipeElement
//    var screenHeight: CGFloat = UIScreen.main.bounds.height
    var body: some View {
        VStack {
            LabeledContent("Cuisine Type:", value: recipe.cuisine)
                .frame(width: 250)
                .padding()
            
            VStack(alignment: .center) {
                
                Text(recipe.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                ImageView(url: recipe.photoURLLarge)
                    .frame(width: 300, height: 200)
                    .clipShape(.rect(cornerRadius: 12.0))
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.10000000149011612)), radius:5.95, x:0, y:2.5)
                
                if let urlStringYT = recipe.youtubeURL {
                    if let url = URL(string: urlStringYT) {
                        Link("Watch Recipe Tutorial", destination: url)
                            .padding()
                    }
                }
                if let urlStringSRC = recipe.sourceURL {
                    if let url = URL(string: urlStringSRC ) {
                        Link("Visit Recipe Source", destination: url)
                    }
                }
            }
            // Could implement WebKit view to display source url's contents in window
        }
    }
}

#Preview {
    RecipeDetailsView(recipe:
            .init(cuisine: "Malaysian",
                  name: "Apam Balik",
                  photoURLLarge:"https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                  photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                  sourceURL: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                  id: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
                  youtubeURL: "https://www.youtube.com/watch?v=6R8ffRRJcrg"))
}
