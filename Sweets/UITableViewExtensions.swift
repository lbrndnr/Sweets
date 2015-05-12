//
//  TableVIew.swift
//  Sweets
//
//  Created by Laurin Brandner on 07/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import UIKit

extension UITableView {

    // MARK: - Registration
    
    public func registerReusableCellClass(cellClass: UITableViewCell.Type) {
        registerClass(cellClass, forCellReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    public func registerReusableHeaderFooterViewClass(viewClass: UITableViewHeaderFooterView.Type) {
        registerClass(viewClass, forHeaderFooterViewReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    // MARK: - Dequeuing
    
    public func dequeueReusableCell<T: UITableViewCell>(type: T.Type) -> T? {
        return dequeueReusableCellWithIdentifier(NSStringFromClass(type)) as? T
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(type: T.Type, indexPath: NSIndexPath) -> T {
        let reuseIdentifier = NSStringFromClass(type)
        let cell = dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as? T
        return cell ?? T(style: .Default, reuseIdentifier: NSStringFromClass(type))
    }
    
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(type: T.Type) -> T? {
        return dequeueReusableHeaderFooterViewWithIdentifier(NSStringFromClass(type)) as? T
    }
    
}
