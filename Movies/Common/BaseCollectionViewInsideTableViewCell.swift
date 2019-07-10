//
//  BaseCollectionViewInsideTableViewCell.swift
//  Movies
//
//  Created by Laura on 7/9/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import UIKit

class BaseCollectionViewInsideTableViewCell: UITableViewCell {

    private var cards: [Card]?
    private var space: CGFloat = 0.0
    
    func configureCell(with any: Any) {
        // implementation provided by subclass
    }

    func setupGrid(with cards: [Card], _ space: CGFloat) {
        self.cards = cards
        self.space = space
    }
 
    class func getIdentifier() -> String {
        return String(describing: self)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout -
extension BaseCollectionViewInsideTableViewCell: UICollectionViewDelegateFlowLayout
{
    // set cell's size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: cards?[indexPath.row].width ?? 0.0, height: cards?[indexPath.row].height ?? 0.0)
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
