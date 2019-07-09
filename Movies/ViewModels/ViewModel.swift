//
//  ViewModel.swift
//  Movies
//
//  Created by Laura on 7/8/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import Foundation
import UIKit

enum SectionType {
    case filters
    case movies
}

protocol Section {
    var type: SectionType { get }
    var title: String { get }
    var rowCount: Int { get }
    var height: CGFloat { get }
}

extension Section {
    var rowCount: Int {
        return 1
    }
}

struct FiltersSection: Section {
    var type: SectionType {
        return .filters
    }
    
    var title: String {
        return "Filters"
    }
    
    var filters = [Filter]()
    
    var height: CGFloat {
        return 70.0
    }
    
    init(filters: [Filter]) {
        self.filters = filters
    }
}

struct MoviesSection: Section {
    var type: SectionType {
        return .movies
    }
    
    var title: String {
        return "All Movies"
    }
    
    var movies = [Movie]()
    
    var height: CGFloat {
        return 600.0
    }

    mutating func appendMovies(movies: [Movie]) {
        self.movies += movies
    }
    
    init(movies: [Movie]) {
        self.movies = movies
    }
}
