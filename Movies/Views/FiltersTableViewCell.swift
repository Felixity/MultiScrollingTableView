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

class FiltersTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: FiltersTableViewCellDelegate?
    
    private var filters: [Filter] = []
    
    private let filterButtonPadding: CGFloat = 16.0
    private let space: CGFloat = 10.0

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    override func configureCell(with any: Any) {
        if let filtersSection = any as? FiltersSection {
            self.filters = filtersSection.filters
            collectionView.reloadData()
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

// MARK: - UICollectionViewDelegateFlowLayout -
extension FiltersTableViewCell: UICollectionViewDelegateFlowLayout
{
    // set cell's size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let sizingLabel = UILabel()
        sizingLabel.text = filters[indexPath.row].name
        sizingLabel.font = UIFont.systemFont(ofSize: 15)
        
        let cardWidth: CGFloat = sizingLabel.intrinsicContentSize.width + filterButtonPadding
        let cardHeight: CGFloat = 50.0
        
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
