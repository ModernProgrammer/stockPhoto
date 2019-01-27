//
//  ViewController.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/27/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit
import CBFlashyTabBarController

class ToolbarController: CBFlashyTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBa
        let homeImage = UIImage(named: "home")
        let exploreImage = UIImage(named: "explore")
        let profileImage = UIImage(named: "profile")
        
        let homeViewController = UIViewController()
        homeViewController.view.backgroundColor = .white
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: homeImage, selectedImage: homeImage)
        
        let exploreViewController = UIViewController()
        exploreViewController.view.backgroundColor = .white
        exploreViewController.tabBarItem = UITabBarItem(title: "Explore", image: exploreImage, selectedImage: exploreImage)
        
        let profileViewController = UIViewController()
        profileViewController.view.backgroundColor = .white
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: profileImage, selectedImage: profileImage)
        
        let tabBarList = [homeViewController, exploreViewController, profileViewController]
        tabBar.tintColor = .black
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        viewControllers = tabBarList
    }
    
    
}

