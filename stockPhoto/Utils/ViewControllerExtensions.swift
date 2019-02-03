//
//  NavbarExtensions.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/27/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupWhiteNavBar() {
        navigationController?.navigationBar.tintColor = UIColor.themeBlack
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.themeBlack]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    func setupClearNavBar() {
        navigationController?.navigationBar.tintColor =  UIColor.themeBlack
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.isTranslucent = true
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingBottom: CGFloat, paddingLeft: CGFloat, paddingRight: CGFloat, width: CGFloat,height: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func fadeIn(_ duration: TimeInterval = 0.3, delay: TimeInterval = 0.3, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)  }
    
    func fadeOut(_ duration: TimeInterval = 0.3, delay: TimeInterval = 0.3, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
}

extension UIImage {
    static let dismissIcon  = UIImage(named: "dismiss")
    static let menuIcon     = UIImage(named: "menu")
    static let exploreIcon  = UIImage(named: "explore")
    static let lovedIcon    = UIImage(named: "loved")
    static let homeIcon     = UIImage(named: "home")
    static let profileIcon  = UIImage(named: "profile")
    static let searchIcon   = UIImage(named: "search")
    static let settingsIcon = UIImage(named: "settings")
}
