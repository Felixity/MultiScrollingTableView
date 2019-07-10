//
//  MovieList.swift
//  Movies
//
//  Created by Laura on 7/7/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import Foundation

struct MovieList {
    fileprivate(set) var movies: [Movie]
    fileprivate(set) var totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
        case totalPages = "total_pages"
    }
}

extension MovieList: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        movies = try container.decode([Movie].self, forKey: .movies)
        totalPages = try container.decode(Int.self, forKey: .totalPages)
    }
}
