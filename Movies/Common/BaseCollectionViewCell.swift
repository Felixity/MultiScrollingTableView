//
//  BaseCollectionViewCell.swift
//  Movies
//
//  Created by Laura on 7/9/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    func configureCell(with anyData: Any? = nil) {
        // implementation provided in subclass
    }

    class func getIdentifier() -> String
    {
        return String(describing: self)
    }

}

