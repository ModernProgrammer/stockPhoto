//
//  Image.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 2/2/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

struct Image {
    var image : String
    var title : String
    var description : String
    init(image : String, title : String, description : String) {
        self.image = image
        self.title = title
        self.description = description
    }
}
