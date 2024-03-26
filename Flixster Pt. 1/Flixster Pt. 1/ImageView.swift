//
//  ImageView.swift
//  Flixster Pt. 1
//
//  Created by Ashly Ruiz on 1/29/24.
//

import SwiftUI
import Nuke

struct ImageView: View {
    let withPath: String?

    private var baseURL: URL {
        URL(string: "https://image.tmdb.org/t/p/w500")!
    }

    private var imageURL: URL? {
        guard let path = withPath else { return nil }
        return baseURL.appendingPathComponent(path)
    }

    var body: some View {
        if let url = imageURL {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 50, height: 75)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            .background(Color.green) // Set background color to green
        } else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 75)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .background(Color.green) // Set background color to green
        }
    }
}


struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withPath: "/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg")
    }
}
