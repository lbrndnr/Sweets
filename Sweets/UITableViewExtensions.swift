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
    
    public func registerClassForCellReuse(cellClass: UITableViewCell.Type) {
        registerClass(cellClass, forCellReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    // MARK: - Dequeuing
    
    public func dequeueReusableCell<T: UITableViewCell>(type: T.Type, indexPath: NSIndexPath) -> T {
        let reuseIdentifier = NSStringFromClass(type)
        let cell = dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as? T
        return cell ?? T(style: .Default, reuseIdentifier: NSStringFromClass(type))
    }
    
}
