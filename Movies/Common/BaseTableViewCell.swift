//
//  BaseTableViewCell.swift
//  Movies
//
//  Created by Laura on 7/9/19.
//  Copyright © 2019 Laura. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    /*
    private var cardWidth: CGFloat = 0.0
    private var cardHeight: CGFloat = 0.0
    private var space: CGFloat = 0.0
     */
    
    func configureCell(with any: Any) {
        // implementation provided by subclass
    }

    /*
    func setupGrid(with cardWidth: CGFloat, _ cardHeight: CGFloat, _ space: CGFloat) {
        self.cardWidth = cardWidth
        self.cardHeight = cardHeight
        self.space = space
    }
     */
 
    class func getIdentifier() -> String
    {
        return String(describing: self)
    }
    
}

/*
// MARK: - UICollectionViewDelegateFlowLayout -
extension BaseTableViewCell: UICollectionViewDelegateFlowLayout
{
    // set cell's size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
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
*/
