//
//  Filter.swift
//  Movies
//
//  Created by Laura on 7/8/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import Foundation
import UIKit

enum FilterType {
    case upcoming
    case nowPlaying
    case topRated
}

struct Filter {
    var name: String
    var color: UIColor
    var type: FilterType
}
