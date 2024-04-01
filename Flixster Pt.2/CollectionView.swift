//
//  CollectionView.swift
//  Flixster Pt.2
//
//  Created by Ashly Ruiz on 3/27/24.
//

import SwiftUI

struct CollectionView: View {
    @State private var movies: [Movie] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(movies, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            VStack {
                                if let posterPath = movie.posterPath {
                                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 150, height: 225)
                                    .cornerRadius(10)
                                } else {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 225)
                                        .cornerRadius(10)
                                }
                                Text(movie.title)
                                    .font(.headline)
                                    .lineLimit(1)
                                Text(movie.overview)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Posters")
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
                case .success(let movies):
                    print("Successfully fetched \(movies.count) movies.")
                    self.movies = movies
                case .failure(let error):
                    print("Error fetching movies:", error)
                    // Handle network error if needed
                }
            }
        }
    }
}
