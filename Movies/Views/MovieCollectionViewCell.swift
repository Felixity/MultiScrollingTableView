//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by Laura on 7/8/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import UIKit
import Alamofire

class MovieCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func configureCell(with anyData: Any?) {
        if let movie = anyData as? Movie {
            // reset all existing info
            posterImageView.image = nil
            titleLabel.text = nil
            
            // download image
            print(movie.imageURL?.absoluteString)
            titleLabel.text = movie.title
        }
    }
    
}
