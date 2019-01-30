//
//  ProfileStats.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/30/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

struct ProfileStats {
    let posts : Int
    let followers : Int
    let following: Int
    
    init(posts: Int, followers: Int, following: Int) {
        self.posts = posts
        self.followers = followers
        self.following = following
    }
}
