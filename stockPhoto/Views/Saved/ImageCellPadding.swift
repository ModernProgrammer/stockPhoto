//
//  SavedCell.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/27/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class ImageCellPadding: UICollectionViewCell {
    let padding : CGFloat = 20
    let shadowPadding : CGFloat = 40
    
    let container : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let imageView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    func addShadow() {
        let shadowView = UIView(frame: CGRect(x: container.frame.minX, y: container.frame.minY, width: frame.width-shadowPadding, height: frame.height-shadowPadding))
        shadowView.clipsToBounds = false
        shadowView.layer.shadowColor = UIColor(white: 0.0, alpha: 1.0).cgColor
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowOffset = CGSize(width: 5, height: 3)
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: 10).cgPath
        container.addSubview(shadowView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(container)
        container.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: padding, paddingBottom: padding, paddingLeft: padding, paddingRight: padding, width: 0, height: 0)
        addShadow()
        
        container.addSubview(imageView)
        imageView.anchor(top: container.topAnchor, bottom: container.bottomAnchor, leading: container.leadingAnchor, trailing: container.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
