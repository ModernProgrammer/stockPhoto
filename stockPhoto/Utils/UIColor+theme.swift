//
//  UIColor+theme.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/27/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let themeCyan      = UIColor.rgb(red: 196, green: 234, blue: 227)
    static let themeLightBlue = UIColor.rgb(red: 218, green: 230, blue: 237)
    static let themeGray      = UIColor.rgb(red: 209, green: 210, blue: 214)
    static let themeDarkGray  = UIColor.rgb(red: 70, green: 77, blue: 85)
    static let themeBlack     = UIColor.rgb(red: 20, green: 20, blue: 20)
}

