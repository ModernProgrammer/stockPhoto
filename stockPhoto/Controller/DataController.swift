//
//  ImageController.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 2/2/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class DataController  {
    static let shared = DataController()
    var imageGallery : [ImageGallery]?
    var images : [Image] = [
        Image(image: "nomadElCaptan", title: "El Captin", description: "by Diego E Bustamante"),
        Image(image: "nomadGlacier", title: "Glacier", description: "by Diego E Bustamante"),
        Image(image: "nomadLostCoast", title: "Lost Coast", description: "by Diego E Bustamante"),
        Image(image: "nomadSanoma", title: "Sanoma", description: "by Diego E Bustamante"),
        Image(image: "nomadTheSurf", title: "The Surf", description: "by Diego E Bustamante"),
        Image(image: "blueocean", title: "Blue Ocean", description: "by Diego E Bustamante"),
        Image(image: "liberty", title: "Liberty", description: "by Diego E Bustamante"),
        Image(image: "mountain", title: "Mountain", description: "by Diego E Bustamante"),
        Image(image: "snowy", title: "Snowy", description: "by Diego E Bustamante")
    ]
    
    var profileStats = ProfileStats(posts: 9, followers: 23, following: 5)
    
    func setupImageGalleryData() {
        imageGallery =  [
            ImageGallery(image: images, title: "Ocean", coverImage: "blueocean"),
            ImageGallery(image: images, title: "Coast", coverImage: "nomadTheSurf"),
            ImageGallery(image: images, title: "Mountain", coverImage: "mountain"),
            ImageGallery(image: images, title: "City", coverImage: "liberty"),
            ImageGallery(image: images, title: "Life", coverImage: "nomadLostCoast")
        ]
    }
}
