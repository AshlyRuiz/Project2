//
//  MovieDetailView.swift
//  Flixster Pt. 1
//
//  Created by Ashly Ruiz on 1/29/24.
//

import SwiftUI
import Nuke

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Adjust frame to fill the first third of the screen
                    ImageView(withPath: movie.backdropPath?.absoluteString)
                        .frame(height: geometry.size.height / 3)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                    Text(movie.title)
                        .font(.title)
                    Text(movie.fullDescription)
                        .font(.body)
                    Text("Vote Average: \(movie.voteAverage)")
                    Text("Vote Count: \(movie.voteCount)")
                    Text("Popularity: \(movie.popularity)")
                }
                .padding()
            }
            .navigationBarTitle(movie.title)
        }
    }
    
    struct MovieDetailView_Previews: PreviewProvider {
        static var previews: some View {
            MovieDetailView(movie: movies[0])
        }
    }
}
