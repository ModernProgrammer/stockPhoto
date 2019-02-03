//
//  ViewController.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/27/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit
import CBFlashyTabBarController

class TabbarController: CBFlashyTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarUI()
        let imageController = DataController.shared
        imageController.setupImageGalleryData()
    }
}

// MARK: tabbar Functions
extension TabbarController {
    fileprivate func setupTabbarUI() {
        let flowlayoutHome = UICollectionViewFlowLayout()
        let flowlayoutSaved = UICollectionViewFlowLayout()
        
        let homeViewController = HomeViewController(collectionViewLayout :flowlayoutHome)
        let savedViewController = SavedViewController(collectionViewLayout :flowlayoutSaved)
        let profileViewController = ProfileViewController()
        
        let homeNavViewController = templateNavbarTabbarView(title: "Home", image: UIImage.homeIcon!, viewController: homeViewController)
        let savedNavViewController = templateNavbarTabbarView(title: "Saved", image: UIImage.lovedIcon!, viewController: savedViewController)
        let profileNavViewController = templateNavbarTabbarView(title: "Profile", image: UIImage.profileIcon!, viewController: profileViewController)
        
        let tabBarList = [homeNavViewController, savedNavViewController, profileNavViewController]
        tabBar.tintColor = .themeBlack
        
        // removes topline shadow
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        viewControllers = tabBarList
    }
    
    fileprivate func templateNavbarTabbarView(title: String, image: UIImage, viewController: UIViewController) -> UINavigationController {
        let tabbarItem = UITabBarItem(title: title, image: image, selectedImage: image)
        viewController.tabBarItem = tabbarItem
        let navbarViewController = UINavigationController(rootViewController: viewController)
        return navbarViewController
    }
}

