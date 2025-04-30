//
//  ImageView.swift
//  FetchMobileTakeHomeProject
//
//  Created by Carlos Cortes Escobar on 4/30/25.
//

import SwiftUI

struct ImageView: View {
    @State var imageLoader: ImageLoader
    
    init(url: String) {
        self.imageLoader = ImageLoader(url: url)
    }
    var body: some View {
        if let image = imageLoader.image {
            image.resizable()
        }
    }
}

#Preview {
    ImageView(url: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg")
}
