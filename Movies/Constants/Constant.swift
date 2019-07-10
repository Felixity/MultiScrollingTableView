//
//  Constant.swift
//  Movies
//
//  Created by Laura on 7/8/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import Foundation

struct Constant {
    static let filters = [
        Filter(name: "Upcoming", color: .green, type: FilterType.upcoming),
        Filter(name: "Now Playing", color: .orange, type: FilterType.nowPlaying),
        Filter(name: "Top Rated", color: .yellow, type: FilterType.topRated)
    ]
}
