//
//  Movie.swift
//  Movies
//
//  Created by Laura on 7/7/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import Foundation

private let baseURL = "https://image.tmdb.org/t/p/"
private let imageSize = "w200/"

struct Movie {
    fileprivate(set) var id: Int
    fileprivate(set) var title: String
    fileprivate(set) var poster: String?
    fileprivate(set) var overview: String
    
    var imageURL: URL? {
        var url: URL?
        if let posterPath = self.poster {
            url = URL(fileURLWithPath: baseURL + imageSize + posterPath)
        }
        return url
    }
    
    enum MovieCodingKey: String, CodingKey {
        case id
        case title
        case poster = "poster_path"
        case overview
    }
}

extension Movie: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKey.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        poster = try container.decode(String.self, forKey: .poster)
        overview = try container.decode(String.self, forKey: .overview)
    }
}
