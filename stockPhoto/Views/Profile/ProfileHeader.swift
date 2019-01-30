//
//  ProfileHeader.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/27/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionViewCell {
    var posts = 0
    var followers = 0
    var following = 0
    let statFontSize: CGFloat = 24
    let labelFontSize: CGFloat = 12
    
    var stats : ProfileStats? {
        didSet {
            guard let stat = stats else { return }
            posts = stat.posts
            followers = stat.followers
            following = stat.following
        }
    }
    
    let imageView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    let postsCount : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let followerCount : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let followingCount : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let statView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI()
    }
    
    fileprivate func setupCellUI() {
        addSubview(imageView)
        imageView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(statView)
        statView.anchor(top: nil, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 86)
        
        let stackView = UIStackView(arrangedSubviews: [postsCount, followerCount, followingCount])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        setStats()
        statView.addSubview(stackView)
        stackView.anchor(top: statView.topAnchor, bottom: statView.bottomAnchor, leading: statView.leadingAnchor, trailing: statView.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    fileprivate func setStats() {
        let attributedText = NSMutableAttributedString(string: String(posts), attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: statFontSize), NSAttributedString.Key.foregroundColor:UIColor.themeBlack])
        attributedText.append(NSMutableAttributedString(string: "\nPOSTS", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: labelFontSize), NSAttributedString.Key.foregroundColor:UIColor.themeGray]))
        postsCount.attributedText = attributedText
        
        let attributedTextFollower = NSMutableAttributedString(string: String(followers), attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: statFontSize), NSAttributedString.Key.foregroundColor:UIColor.themeBlack])
        attributedTextFollower.append(NSMutableAttributedString(string: "\nFOLLOWERS", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: labelFontSize), NSAttributedString.Key.foregroundColor:UIColor.themeGray]))
        followerCount.attributedText = attributedTextFollower
        
        let attributedTextFollowing = NSMutableAttributedString(string: String(following), attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: statFontSize), NSAttributedString.Key.foregroundColor:UIColor.themeBlack])
        attributedTextFollowing.append(NSMutableAttributedString(string: "\nFOLLOWING", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: labelFontSize), NSAttributedString.Key.foregroundColor:UIColor.themeGray]))
        followingCount.attributedText = attributedTextFollowing
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
