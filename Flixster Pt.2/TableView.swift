//
//  TableView.swift
//  Flixster Pt.2
//
//  Created by Ashly Ruiz on 3/27/24.
//

import SwiftUI

struct TableView: View {
    @State private var movies: [Movie] = []
    
    var body: some View {
        NavigationView {
            List(movies, id: \.id) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    HStack {
                        if let posterPath = movie.posterPath {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 150)
                                    .cornerRadius(10)
                            } placeholder: {
                                ProgressView()
                            }
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 150)
                                .cornerRadius(10)
                        }
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)
                            Text(movie.overview)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .lineLimit(2)
                        }
                    }
                }
            }
            .navigationBarTitle("Now Playing")
            .onAppear {
                fetchNowPlayingMovies()
            }
        }
    }
    
    private func fetchNowPlayingMovies() {
        print("Fetching now playing movies...")
        MovieService.shared.fetchNowPlayingMovies { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedMovies):
                    self.movies = fetchedMovies
                case .failure(let error):
                    print("Error fetching movies:", error)
                    // Handle network error if needed
                }
            }
        }
    }
}
