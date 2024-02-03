//
//  ImageLoader.swift
//  cinema-shift-2024
//
//  Created by Sergo on 03.02.2024.
//

import UIKit

class ImageLoader {
    static let shared = ImageLoader()
    private var cache = NSCache<NSString, UIImage>()

    private init() {}

    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        let fullURLString = urlString.starts(with: "http") ? urlString : "https://shift-backend.onrender.com\(urlString)"
        guard let url = URL(string: fullURLString) else {
            completion(nil)
            return
        }
        if let cachedImage = cache.object(forKey: fullURLString as NSString) {
            completion(cachedImage)
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    completion(nil)
                    return
                }
                if let data = data, let image = UIImage(data: data) {
                    self?.cache.setObject(image, forKey: fullURLString as NSString)
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
}
