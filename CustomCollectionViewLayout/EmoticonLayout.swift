//
//  EmoticonLayout.swift
//  CustomCollectionViewLayout
//
//  Created by cochn on 2017/7/6.
//  Copyright © 2017年 cochn. All rights reserved.
//

import UIKit

class EmoticonLayout: UICollectionViewLayout {

    var sectionWidth: Double = 0.0
    
    fileprivate var atts: [UICollectionViewLayoutAttributes] = []
    
    override func prepare() {
        
        super.prepare()
        
        atts.removeAll()
        
        let column = 5
        let count = 15
        let cellWidth = 71.0, cellHeight = 71.0
        
        let sections = self.collectionView?.numberOfSections
        var sectionMaxWidth = 0.0
        for i  in 0 ..< sections! {
            let items = self.collectionView?.numberOfItems(inSection: i)
            
            for ii in 0 ..< items! {
                
                let indexPath = NSIndexPath.init(item: ii, section: i)
                let att = UICollectionViewLayoutAttributes.init(forCellWith: indexPath as IndexPath)
                
                let linex = ii % column
                let lineCount = ii / count
                let x = cellWidth * Double(linex) + Double(lineCount) * Double((self.collectionView?.bounds.size.width)!) + sectionMaxWidth
                
                let columnCount = ii % count / column
                let y = cellHeight * Double(columnCount)
                
                att.frame = CGRect.init(x: x, y: y, width: cellWidth, height: cellHeight)
                
                atts.append(att)
            }
            
            sectionMaxWidth += ceil(Double(items!) / Double(count)) * Double((self.collectionView?.bounds.size.width)!)
            
        }
        
        sectionWidth = sectionMaxWidth
    }
    
    override var collectionViewContentSize: CGSize {
        get{
            
            let height = 71.0 * 3.0
            return CGSize.init(width: sectionWidth, height: height)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return atts;
    }
    
    
    
}





