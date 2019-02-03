//
//  StretchyHeaderLayout.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/30/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                guard let width = collectionView?.frame.width else { return }
                guard let contentOffsetY: CGFloat = collectionView?.contentOffset.y else { return }
                
                if contentOffsetY > 0 {
                    return
                }
                
                let height = attributes.frame.height - contentOffsetY
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
