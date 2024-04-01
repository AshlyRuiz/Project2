//
//  MovieDetailView.swift
//  Flixster Pt.2
//
//  Created by Ashly Ruiz on 3/27/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let posterPath = movie.posterPath {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
                .cornerRadius(10)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)
                Text(movie.overview)
                    .font(.body)
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle(movie.title)
    }
}

