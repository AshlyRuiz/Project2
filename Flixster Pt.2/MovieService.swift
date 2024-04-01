//
//  MovieService.swift
//  Flixster Pt.2
//
//  Created by Ashly Ruiz on 3/27/24.
//

import Foundation

class MovieService {
    static let shared = MovieService()
    private let apiKey = "58e489e88b1bcd8661536c90e5624783"
    
    func fetchNowPlayingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/now_playing?api_key=58e489e88b1bcd8661536c90e5624783"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("Error fetching movies:", error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(NetworkError.invalidResponse))
                print("Invalid response")
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                print("Invalid data")
                return
            }
            
            do {
                // Print the fetched data
                let jsonString = String(data: data, encoding: .utf8)
                print("Fetched data:", jsonString ?? "")
                
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(response.movies))
            } catch {
                completion(.failure(error))
                print("Error decoding movies:", error)
            }
        }.resume()
    }

    
    
    enum NetworkError: Error {
        case invalidURL
        case invalidResponse
        case invalidData
    }
    
}
