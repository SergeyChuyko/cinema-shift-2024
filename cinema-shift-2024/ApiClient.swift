//
//  ApiClient.swift
//  cinema-shift-2024
//
//  Created by Sergo on 03.02.2024.
//

import Foundation

class CinemaAPI {
    static let shared = CinemaAPI()

    private let baseURL = "https://shift-backend.onrender.com/cinema/today"
    var films: [Films] = []

    private init() {}

    func fetchTodayCinemaData(completion: @escaping (Result<PosterModel, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let posterModel = try decoder.decode(PosterModel.self, from: data)
                self?.films = posterModel.films
                completion(.success(posterModel))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}
