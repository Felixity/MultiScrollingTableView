//
//  Movie.swift
//  Movies
//
//  Created by Laura on 7/7/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import Foundation

/*
 {
 "vote_count": 771,
 "id": 429617,
 "video": false,
 "vote_average": 7.8,
 "title": "Spider-Man: Far from Home",
 "popularity": 615.274,
 "poster_path": "/rjbNpRMoVvqHmhmksbokcyCr7wn.jpg",
 "original_language": "en",
 "original_title": "Spider-Man: Far from Home",
 "genre_ids": [
 28,
 12,
 878
 ],
 "backdrop_path": "/dihW2yTsvQlust7mSuAqJDtqW7k.jpg",
 "adult": false,
 "overview": "Peter Parker and his friends go on a summer trip to Europe. However, they will hardly be able to rest - Peter will have to agree to help Nick Fury uncover the mystery of creatures that cause natural disasters and destruction throughout the continent.",
 "release_date": "2019-06-28"
 }
 */

struct Movie {
    var id: Int
    var title: String
    var poster: String?
    var overview: String
//    var releaseDate: Date
    
    enum MovieCodingKey: String, CodingKey {
        case id
        case title
        case poster = "poster_path"
        case overview
//        case releaseDate = "release_date"
    }
}

extension Movie: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKey.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        poster = try container.decode(String.self, forKey: .poster)
        overview = try container.decode(String.self, forKey: .overview)
//        releaseDate = try container.decode(Date.self, forKey: .releaseDate)
    }
}
