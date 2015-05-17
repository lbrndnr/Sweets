//
//  UICollectionViewExtensions.swift
//  Sweets
//
//  Created by Laurin Brandner on 17/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerReusableCellClass(cellClass: UICollectionViewCell.Type) {
        registerClass(cellClass, forCellWithReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    func registerReusableSupplementaryViewClass(viewClass: UICollectionReusableView.Type, elementKind: String) {
        registerClass(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(cellClass: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        let cell = dequeueReusableCellWithReuseIdentifier(NSStringFromClass(cellClass), forIndexPath: indexPath) as? T
        return cell ?? T()
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(viewClass: T.Type, elementKind: String, forIndexPath indexPath: NSIndexPath) -> T {
        let cell = dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: NSStringFromClass(viewClass), forIndexPath: indexPath) as? T
        return cell ?? T()
    }

}
