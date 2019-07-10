//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Laura on 7/8/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import UIKit

class MoviesTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var movies: [Movie] = []
    
    private let space: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    override func configureCell(with any: Any) {
        if let moviesSection = any as? MoviesSection {
            self.movies = moviesSection.movies
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
        
    }
}

// MARK: - UICollectionViewDelegateFlowLayout -
extension MoviesTableViewCell: UICollectionViewDelegateFlowLayout
{
    // set cell's size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let cardWidth = Int((collectionView.bounds.width - 4 * 10) / 3)
        let cardHeight = 300 //Int((collectionView.bounds.height - 3 * 10) / 2)

        return CGSize(width: cardWidth, height: cardHeight)
    }
    
    // set collection view's margins
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: space, left: space, bottom: space, right: space)
    }
    
    // set vertical padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return space
    }
    
    // set horizontal padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return space
    }
}
