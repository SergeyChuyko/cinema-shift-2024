//
//  PosterModel.swift
//  cinema-shift-2024
//
//  Created by Sergo on 02.02.2024.
//

import Foundation

struct PosterModel: Codable {
    let films: [Films]
}

struct Films: Codable {
    let name: String
    let description: String
    let releaseDate: String
    let runtime: Int
    let ageRating: String
    let genres: [String]
    let userRatings: UserRatings
    let img: String
    let country: Country
}

struct Director: Codable {
    let fullName: String
}

struct UserRatings: Codable {
    let kinopoisk: String
}

struct Country: Codable {
    let name: String
}
