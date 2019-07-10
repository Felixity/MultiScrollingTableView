//
//  FiltersTableViewCell.swift
//  Movies
//
//  Created by Laura on 7/8/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import UIKit

protocol FiltersTableViewCellDelegate: class {
    func userDidSelectFilter(_ filter: FilterType, for cell: FiltersTableViewCell)
}

class FiltersTableViewCell: BaseCollectionViewInsideTableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: FiltersTableViewCellDelegate?
    
    private var filters: [Filter] = [] {
        didSet {
            var cards: [Card] = []
            
            for filter in filters {
                let sizingLabel = UILabel()
                sizingLabel.text = filter.name
                sizingLabel.font = UIFont.systemFont(ofSize: 15)

                let cardWidth: CGFloat = sizingLabel.intrinsicContentSize.width + filterButtonPadding
                let cardHeight: CGFloat = 50.0

                let card = Card(width: cardWidth, height: cardHeight)
                cards.append(card)
            }
            
            self.setupGrid(with: cards, space)
        }
    }
    private let filterButtonPadding: CGFloat = 16.0
    private let space: CGFloat = 10.0

    override func configureCell(with any: Any) {
        if let filtersSection = any as? FiltersSection {
            self.filters = filtersSection.filters
            setupCollectionView()
        }
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: FilterCollectionViewCell.getIdentifier(), bundle: nil), forCellWithReuseIdentifier: FilterCollectionViewCell.getIdentifier())
    }
    
}

extension FiltersTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell?
        
        let cellIdentifier = FilterCollectionViewCell.getIdentifier()
        if let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? FilterCollectionViewCell {
            filterCell.configureCell(with: filters[indexPath.row])
            cell = filterCell
        }
        
        return cell ?? UICollectionViewCell(frame: CGRect.zero)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.userDidSelectFilter(filters[indexPath.row].type, for: self)
    }
}
