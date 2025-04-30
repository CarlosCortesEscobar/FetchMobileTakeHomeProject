//
//  FetchMobileTakeHomeProjectApp.swift
//  FetchMobileTakeHomeProject
//
//  Created by Carlos Cortes Escobar on 4/29/25.
//

import SwiftUI

@main
struct FetchMobileTakeHomeProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(service: RecipeService())
        }
    }
}
