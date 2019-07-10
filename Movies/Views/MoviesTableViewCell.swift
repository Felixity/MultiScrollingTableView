//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Laura on 7/8/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import UIKit

protocol MoviesTableViewCellDelegate: class {
    func userDidFinishScrolling(for cell: MoviesTableViewCell)
}

class MoviesTableViewCell: BaseCollectionViewInsideTableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: MoviesTableViewCellDelegate?
    
    private var movies: [Movie] = [] {
        didSet {
            let cardWidth: CGFloat = CGFloat(Int((UIScreen.main.bounds.width - 4 * 10) / 3))
            let cardHeight: CGFloat = 300.0
            let cards = Array(repeating: Card(width: cardWidth, height: cardHeight), count: movies.count)
            setupGrid(with: cards, space)
        }
    }
    private var shouldLoadMoreData = true
    
    private let space: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    override func configureCell(with any: Any) {
        if let moviesSection = any as? MoviesSection {
            self.movies = moviesSection.movies
            self.shouldLoadMoreData = moviesSection.shouldLoadMoreData
            collectionView.reloadData()
        }
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: MovieCollectionViewCell.getIdentifier(), bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.getIdentifier())
    }
}

extension MoviesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell?
        
        let cellIdentifier = MovieCollectionViewCell.getIdentifier()
        if let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MovieCollectionViewCell {
            movieCell.configureCell(with: movies[indexPath.row])
            cell = movieCell
        }
        
        return cell ?? UICollectionViewCell(frame: CGRect.zero)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if shouldLoadMoreData && (indexPath.row > movies.count - 5) {
            // ask for more data
            delegate?.userDidFinishScrolling(for: self)
        }
    }
}
