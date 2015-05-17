//
//  TableVIew.swift
//  Sweets
//
//  Created by Laurin Brandner on 07/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import UIKit

extension UITableView {
    
    // MARK: - Information
    
    // The generic type should actually be declared as follows: <T: UITableViewCell>.
    // This caused the Swift compiler to confuse some classes though. Will add this later.
    public func cellForRowAtIndexPath<T>(indexPath: NSIndexPath) -> T? {
        return cellForRowAtIndexPath(indexPath) as? T
    }
    
    public func headerViewForSection<T>(section: Int) -> T? {
        return headerViewForSection(section) as? T
    }

    public func footerViewForSection<T>(section: Int) -> T? {
        return footerViewForSection(section) as? T
    }

    // MARK: - Registration
    
    public func registerReusableCellClass(cellClass: UITableViewCell.Type) {
        registerClass(cellClass, forCellReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    public func registerReusableHeaderFooterViewClass(viewClass: UITableViewHeaderFooterView.Type) {
        registerClass(viewClass, forHeaderFooterViewReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    // MARK: - Dequeuing
    
    public func dequeueReusableCell<T: UITableViewCell>(cellClass: T.Type) -> T? {
        return dequeueReusableCellWithIdentifier(NSStringFromClass(cellClass)) as? T
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(cellClass: T.Type, indexPath: NSIndexPath) -> T {
        let reuseIdentifier = NSStringFromClass(cellClass)
        let cell = dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as? T
        return cell ?? T(style: .Default, reuseIdentifier: reuseIdentifier)
    }
    
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(viewClass: T.Type) -> T? {
        return dequeueReusableHeaderFooterViewWithIdentifier(NSStringFromClass(viewClass)) as? T
    }
    
}
