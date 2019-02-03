//
//  ImageGallery.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 2/2/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

struct ImageGallery {
    var images : [Image]
    var coverImage: String
    var title : String
    init(image : [Image], title : String, coverImage: String) {
        self.images = image
        self.title = title
        self.coverImage = coverImage
    }
}
