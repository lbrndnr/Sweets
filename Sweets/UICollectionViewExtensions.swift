//
//  UICollectionViewExtensions.swift
//  Sweets
//
//  Created by Laurin Brandner on 17/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    // MARK: - Information
    
    // The generic type should actually be declared as follows: <T: UITableViewCell>.
    // This caused the Swift compiler to confuse some classes though. Will add this later.
    public func cellForItemAtIndexPath<T>(indexPath: NSIndexPath) -> T? {
        let cell = cellForItemAtIndexPath(indexPath)
        return cell as? T
    }
    
    public func visibleCells<T>() -> [T] {
        return visibleCells().filter { $0 is T }.map { $0 as! T }
    }
    
    // MARK: - Registration
    
    public func registerReusableCellClass(cellClass: UICollectionViewCell.Type) {
        registerClass(cellClass, forCellWithReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    public func registerReusableSupplementaryViewClass(viewClass: UICollectionReusableView.Type, elementKind: String) {
        registerClass(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    // MARK: - Dequeuing
    
    public func dequeueReusableCell<T: UICollectionViewCell>(cellClass: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        let cell = dequeueReusableCellWithReuseIdentifier(NSStringFromClass(cellClass), forIndexPath: indexPath) as? T
        return cell ?? T()
    }
    
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(viewClass: T.Type, elementKind: String, forIndexPath indexPath: NSIndexPath) -> T {
        let cell = dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: NSStringFromClass(viewClass), forIndexPath: indexPath) as? T
        return cell ?? T()
    }

}
