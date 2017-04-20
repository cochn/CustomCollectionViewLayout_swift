//
//  CustomFlowLayout.swift
//  CustomCollectionViewLayout
//
//  Created by 曹臣 on 2017/4/20.
//  Copyright © 2017年 曹臣. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        
        self.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        let insert = ((self.collectionView?.frame.size.width)! - self.itemSize.width ) * 0.5
        
        self.sectionInset = UIEdgeInsetsMake(0, insert, 0, insert)
        
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        
        return true
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
     
        let atts = super.layoutAttributesForElements(in: rect)
        
        let centerCellCenterX = (self.collectionView?.contentOffset.x)! + (self.collectionView?.frame.size.width)! * 0.5
        
        for  att in atts! {
            
            let centerOffet = att.center.x - centerCellCenterX
            let centerOffetAbs = fabsf(Float(centerOffet))
            
            let scale = 1 - CGFloat(centerOffetAbs) / (self.collectionView?.frame.size.width)! 
            
            att.transform3D = CATransform3DMakeScale(scale, scale, scale)
            
        }
      return atts
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let rect = CGRect.init(x: proposedContentOffset.x, y: 0, width: self.collectionView!.frame.size.width, height: self.collectionView!.frame.size.height)
        
        let atts = super.layoutAttributesForElements(in: rect)
        
        let centerCellCenterX = proposedContentOffset.x + self.collectionView!.frame.size.width * 0.5
        
        var proposedConOffset = proposedContentOffset
        
        var min = MAXFLOAT
        
        for att in atts! {
            
            let offset = att.center.x - centerCellCenterX
            
            if abs(min) > abs(Float(offset)) {
                min = Float(att.center.x) - Float(centerCellCenterX)
                
            }
            
        }
        proposedConOffset.x += CGFloat(min)
        
        return proposedConOffset
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        return UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        
    }
    
}
