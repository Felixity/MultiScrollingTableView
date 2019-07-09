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
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

extension MovieList: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        movies = try container.decode([Movie].self, forKey: .movies)
    }
}
