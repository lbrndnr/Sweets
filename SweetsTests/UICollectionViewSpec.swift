//
//  UICollectionViewSpec.swift
//  Sweets
//
//  Created by Laurin Brandner on 17/05/15.
//  Copyright (c) 2015 Laurin Brandner. All rights reserved.
//

import Sweets
import UIKit
import Quick
import Nimble

class UICollectionViewSpec: QuickSpec, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    class RegisteredCell: UICollectionViewCell {}
    class Cell: UICollectionViewCell {}
    
    class RegisteredSupplementaryView: UICollectionReusableView {}
    class SupplementaryView: UICollectionReusableView {}
    
    override func spec() {
        var collectionView: UICollectionView!
        
        beforeEach {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 100, height: 100)
            layout.headerReferenceSize = layout.itemSize
            layout.footerReferenceSize = layout.itemSize
            
            let controller = UICollectionViewController(collectionViewLayout: layout)
            collectionView = controller.collectionView
            
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.registerReusableCellClass(RegisteredCell.self)
            collectionView.registerReusableSupplementaryViewClass(RegisteredSupplementaryView.self, elementKind: UICollectionElementKindSectionHeader)
            collectionView.registerReusableSupplementaryViewClass(RegisteredSupplementaryView.self, elementKind: UICollectionElementKindSectionFooter)
            
            if let window = UIApplication.sharedApplication().windows.first as? UIWindow {
                window.rootViewController = controller
            }
            
            collectionView.reloadData()
        }
        
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        
        describe("dequeuing") {
            it("dequeues a cell") {
                let cell = collectionView.dequeueReusableCell(RegisteredCell.self, forIndexPath: indexPath)
                expect(cell).to(beTruthy())
            }
            
//            it("dequeues a supplementary view") {
//                let view = collectionView.dequeueReusableSupplementaryView(RegisteredSupplementaryView.self, elementKind: UICollectionElementKindSectionHeader, forIndexPath: indexPath)
//                expect(view).to(beTruthy())
//            }
//            
//            it("dequeues no supplementary view") {
//                let view = collectionView.dequeueReusableSupplementaryView(SupplementaryView.self, elementKind: UICollectionElementKindSectionHeader, forIndexPath: indexPath)
//                expect(view).to(beFalsy())
//            }
        }
        
        describe("info retrieval") {
            it("retrieves cell") {
                let cell: RegisteredCell? = collectionView.cellForItemAtIndexPath(indexPath)
                expect(cell).to(beTruthy())
            }
            
            it("retrieves no cell") {
                let cell: Cell? = collectionView.cellForItemAtIndexPath(indexPath)
                expect(cell).to(beFalsy())
            }
            
//            it("retrieves header footer view") {
//                let headerView: RegisteredHeaderFooterView? = collectionView.headerViewForSection(0)
//                expect(headerView).to(beTruthy())
//                
//                let footerView: RegisteredHeaderFooterView? = collectionView.footerViewForSection(0)
//                expect(footerView).to(beTruthy())
//            }
//            
//            it("retrieves no header footer view") {
//                let headerView: HeaderFooterView? = collectionView.headerViewForSection(0)
//                expect(headerView).to(beFalsy())
//                
//                let footerView: HeaderFooterView? = collectionView.footerViewForSection(0)
//                expect(footerView).to(beFalsy())
//            }
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(RegisteredCell.self, forIndexPath: indexPath)
    }
    
//    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//        return collectionView.dequeueReusableSupplementaryView(RegisteredSupplementaryView.self, elementKind: kind, forIndexPath: indexPath)
//    }

}
