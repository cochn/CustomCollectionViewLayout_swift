//
//  CustomLayout.swift
//  CustomCollectionViewLayout
//
//  Created by 曹臣 on 2017/4/20.
//  Copyright © 2017年 曹臣. All rights reserved.
//

import UIKit

class CustomLayout: UICollectionViewLayout {
    
    private var atts: [UICollectionViewLayoutAttributes] = []
    
    override func prepare() {
        super.prepare()
        
        self.atts.removeAll()
        let count = self.collectionView?.numberOfItems(inSection: 0)
        for i in 0..<count! {
            let indexPath = NSIndexPath.init(item: i, section: 0)
            let att = self.layoutAttributesForItem(at: indexPath as IndexPath)
            self.atts.append(att!)
        }
    }

    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.atts
    }
    
    
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        
        let centerX = (self.collectionView?.frame.size.width)! * 0.5
        let centerY = (self.collectionView?.frame.size.height)! * 0.5
        
        let multi: Double = 100
        let radius: Double = Double(centerX)
        
        let width = 50, height = 50
        let itemSize = CGSize.init(width: width, height: height)
        
        let att: UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        att.size = itemSize
        
        let count  = self.collectionView?.numberOfItems(inSection: 0)
        
        if count == 1 {
            att.center = CGPoint.init(x: centerX, y: centerY)
        }else{
            
            let angle = (2 * Double.pi / Double(count!)) * Double(indexPath.item)
            
            let itemCenterX = radius + multi * sin(angle)
            let itemCenterY = radius + multi * cos(angle)
            
            att.center = CGPoint.init(x: itemCenterX, y: itemCenterY)
        }
        return att
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    
    
}
