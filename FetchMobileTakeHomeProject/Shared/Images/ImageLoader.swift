//
//  ImageLoader.swift
//  FetchMobileTakeHomeProject
//
//  Created by Carlos Cortes Escobar on 4/30/25.
//

//import Foundation
import SwiftUI

@Observable
class ImageLoader {
    var image: Image?
    private let urlString: String
    
    init(url: String) {
        self.urlString = url
        Task { await loadImage() }
    }
    
    @MainActor
    func loadImage() async {
        guard let url = URL(string: urlString) else { return }

        if let cached = ImageCache.shared.get(forKey: urlString) {
            image = Image(uiImage: cached)
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let uiImage = UIImage(data: data) else { return }
            ImageCache.shared.set(uiImage, forKey: urlString)
            self.image = Image(uiImage: uiImage)
        } catch {
            print("ERROR \(error)")
            // Would return skeleton or default image if can't fetch from URL
        }
        
    }
    
}
