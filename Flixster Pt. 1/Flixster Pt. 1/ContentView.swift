//
//  ContentView.swift
//  Flixster Pt. 1
//
//  Created by Ashly Ruiz on 1/29/24.
//

import SwiftUI
import Nuke

struct ContentView: View {
    var body: some View {
        NavigationView {
            MovieList()
        }
    }
}

struct MovieList: View {
    var body: some View {
        List(movies, id: \.id) { movie in
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                MovieRow(movie: movie)
            }
        }
        .navigationBarTitle("Movie List")
    }
}

struct MovieRow: View {
    let movie: Movie

    var body: some View {
        HStack {
            ImageView(withPath: movie.posterPath?.absoluteString)
                .frame(width: 50, height: 75)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.partialDescription)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
