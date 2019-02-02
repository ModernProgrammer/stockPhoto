//
//  ImageViewController.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 2/1/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    let imageView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    let container : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
