//
//  TableVIew.swift
//  Sweets
//
//  Created by Laurin Brandner on 07/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import UIKit

public class TableView: UITableView {

    // MARK: - Registration
    
    public func registerClassForCellReuse(cellClass: UITableViewCell.Type) {
        registerClass(cellClass, forCellReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    override public func registerClass(cellClass: AnyClass, forCellReuseIdentifier identifier: String) {
        precondition(NSStringFromClass(cellClass) == identifier, "Identifier must be equal to the cell class name")
        
        super.registerClass(cellClass, forCellReuseIdentifier: identifier)
    }
    
    // MARK: - Dequeuing
    
    public func dequeueReusableCell<T: UITableViewCell>(type: T.Type, indexPath: NSIndexPath) -> T {
        let reuseIdentifier = NSStringFromClass(type)
        let cell = dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as? T
        return cell ?? T(style: .Default, reuseIdentifier: NSStringFromClass(type))
    }
    
}
