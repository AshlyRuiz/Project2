//
//  Movie.swift
//  Flixster Pt.2
//
//  Created by Ashly Ruiz on 2/7/24.
//

import Foundation

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
    }
}

struct MovieResponse: Codable {
    let movies: [Movie]

    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}


func decodeJSONData() {
    let jsonData = Data()
    do {
        let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: jsonData)
        let movies = movieResponse.movies
    } catch {
        print("Error decoding JSON: \(error)")
    }
}

func main() {
    decodeJSONData()
}


