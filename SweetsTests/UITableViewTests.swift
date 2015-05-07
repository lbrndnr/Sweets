//
//  TableViewTests.swift
//  Sweets
//
//  Created by Laurin Brandner on 07/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import UIKit
import XCTest

class TableViewTests: XCTestCase, UITableViewDataSource {
    
    class Cell: UITableViewCell {}
    
    let tableView = UITableView()
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        
        tableView.dataSource = self
        tableView.registerClassForCellReuse(UITableViewCell.self)
    }
    
    // MARK: - Tests

    func testCellRegistration() {
        tableView.registerClassForCellReuse(Cell.self)
        let cell = tableView.dequeueReusableCell(Cell.self, indexPath: NSIndexPath(forRow: 0, inSection: 0))
        
        XCTAssertNotNil(cell, "The cell couldn't be dequeued")
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return self.tableView.dequeueReusableCell(UITableViewCell.self, indexPath: NSIndexPath(forRow: 0, inSection: 0))
    }

}
