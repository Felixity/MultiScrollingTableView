//
//  FilterCollectionViewCell.swift
//  Movies
//
//  Created by Laura on 7/8/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import Foundation
import UIKit

class FilterCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var filterButton: UIButton!
    
    private let space: CGFloat = 10.0
    
    override func configureCell(with anyData: Any?) {
        if let filter = anyData as? Filter {
            filterButton.setTitle(filter.name, for: .normal)
            filterButton.backgroundColor = filter.color
            filterButton.layer.cornerRadius = 8
            filterButton.layer.masksToBounds = true
        }
    }
    
    @IBAction func onFilterPress(_ sender: UIButton) {
    }
}
