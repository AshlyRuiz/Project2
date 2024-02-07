//
//  Movie.swift
//  Flixster Pt. 1
//
//  Created by Ashly Ruiz on 1/29/24.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let posterPath: URL?
    let partialDescription: String
    let fullDescription: String
    let backdropPath: URL?
    let voteAverage: Double
    let voteCount: Int
    let popularity: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, partialDescription, fullDescription, voteAverage, voteCount, popularity, posterPath, backdropPath
    }
}

extension Movie {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        partialDescription = try container.decode(String.self, forKey: .partialDescription)
        fullDescription = try container.decode(String.self, forKey: .fullDescription)
        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        voteCount = try container.decode(Int.self, forKey: .voteCount)
        popularity = try container.decode(Double.self, forKey: .popularity)

        let baseURL = URL(string: "https://image.tmdb.org/t/p/original")!
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath).map { baseURL.appendingPathComponent($0) }
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath).map { baseURL.appendingPathComponent($0) }
    }
}

var movies: [Movie] = [
    Movie(
        id: 572802,
        title: "Aquaman and the Lost Kingdom",
        posterPath: URL(string:"/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg")!,
        partialDescription: "Black Manta, still driven by the need to avenge his father's death...",
        fullDescription: "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.",
        backdropPath: URL(string:"/cnqwv5Uz3UW5f086IWbQKr3ksJr.jpg")!,
        voteAverage: 6.992,
        voteCount: 1267,
        popularity: 2392.899
    ),
    Movie(
        id: 787699,
        title: "Wonka",
        posterPath: URL(string:"/qhb1qOilapbapxWQn9jtRCMwXJF.jpg")!,
        partialDescription: "Willy Wonka – chock-full of ideas and determined to change the world...",
        fullDescription: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible...",
        backdropPath: URL(string:"/yyFc8Iclt2jxPmLztbP617xXllT.jpg")!,
        voteAverage: 7.229,
        voteCount: 1721,
        popularity: 1989.417
            ),
    Movie(
        id: 940551,
        title: "Migration",
        posterPath: URL(string:"/ldfCF9RhR40mppkzmftxapaHeTo.jpg")!,
        partialDescription: "After a migrating duck family alights on their pond with thrilling tales of...",
        fullDescription: "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
        backdropPath: URL(string:"/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg")!,
        voteAverage: 7.757,
        voteCount: 434,
        popularity: 1356.633
            ),
    Movie(
        id: 866398,
        title: "The Beekeeper",
        posterPath: URL(string:"/A7EByudX0eOzlkQ2FIbogzyazm2.jpg")!,
        partialDescription: "One man’s campaign for vengeance takes on national stakes after he is revealed to...",
        fullDescription: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.",
        backdropPath: URL(string:"/unvtbkgxh47BewQ8pENvdOdme0r.jpg")!,
        voteAverage: 7.346,
        voteCount: 428,
        popularity: 1268.827
            ),
    Movie(
        id: 1212073,
        title: "60 Minuten",
        posterPath: URL(string:"/cND79ZWPFINDtkA8uwmQo1gnPPE.jpg")!,
        partialDescription: "Desperate to keep custody of his daughter, a mixed martial arts fighter abandons a...",
        fullDescription: "Desperate to keep custody of his daughter, a mixed martial arts fighter abandons a big match and races across Berlin to attend her birthday party",
        backdropPath: URL(string:"/pWsD91G2R1Da3AKM3ymr3UoIfRb.jpg")!,
        voteAverage: 6.966,
        voteCount: 193,
        popularity: 899.318
            ),
]

