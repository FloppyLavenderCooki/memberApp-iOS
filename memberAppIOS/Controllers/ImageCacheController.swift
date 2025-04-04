//
//  ImageCacheController.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 04/04/2025.
//

import SwiftUI

class ImageCacheController: ObservableObject {
    @Published var cachedImages: [String: CachedImage] = [:]

    struct CachedImage {
        let image: Image
        let lastLoaded: Date
    }

    func loadImage(for urlString: String, placeholder: Image, reloadInterval: TimeInterval = 1800) -> Image {
        if let cached = cachedImages[urlString], Date().timeIntervalSince(cached.lastLoaded) < reloadInterval {
            return cached.image
        } else {
            if let url = URL(string: urlString), let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
                let image = Image(uiImage: uiImage)
                cachedImages[urlString] = CachedImage(image: image, lastLoaded: Date())
                return image
            } else {
                return placeholder
            }
        }
    }
}

