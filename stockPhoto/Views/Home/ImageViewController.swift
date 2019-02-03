//
//  ImageViewController.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 2/1/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    let imageController = ImageController.shared
    var image : Image? {
        didSet {
            guard let image = image else { return }
            let attributedText = NSMutableAttributedString(string: "\(image.title)\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 34), NSAttributedString.Key.foregroundColor : UIColor.themeBlack])
            attributedText.append(NSMutableAttributedString(string: "\n\n~\n\n\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 8)]))
            attributedText.append(NSMutableAttributedString(string: "\(image.description)\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.themeDarkGray]))
            imageTitle.attributedText = attributedText
            imageView.image = UIImage(named: image.image)
        }
    }
    
    let imageView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    
    let imageContainer : UIView = {
        let view = UIView()
        view.backgroundColor = .themeBlack
        return view
    }()
    
    let container : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let imageTitle : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "TESTING"
        return label
    }()
    
    let downloadButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handleDownload), for: .touchUpInside)
        button.backgroundColor = .themeBlack
        button.setTitle("Download", for: .normal)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClearNavBar()
        setupUI()
        setupMainStackView()
        setupContainerView()
        applyMotionEffect()
    }
    
    func applyMotionEffect() {
        let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = -30
        xMotion.maximumRelativeValue = 30
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -30
        yMotion.maximumRelativeValue = 30
        
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [xMotion,yMotion]
        imageView.addMotionEffect(group)
    }
}

// MARK: UI Functions
extension ImageViewController {
    fileprivate func setupUI() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.dismissIcon!, style: .plain, target: self, action: #selector(handleDismiss))
    }
    
    fileprivate func setupMainStackView() {
        
        let mainStackView = UIStackView(arrangedSubviews: [imageContainer,container])
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        view.addSubview(mainStackView)
        imageContainer.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
        container.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
        mainStackView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    fileprivate func setupContainerView() {
        imageContainer.addSubview(imageView)
        imageView.anchor(top: imageContainer.topAnchor, bottom: imageContainer.bottomAnchor, leading: imageContainer.leadingAnchor, trailing: imageContainer.trailingAnchor, paddingTop: -50, paddingBottom: -50, paddingLeft: -50, paddingRight: -50, width: 0, height: 0)
        
        container.addSubview(downloadButton)
        container.addSubview(imageTitle)
        imageTitle.translatesAutoresizingMaskIntoConstraints = false
        imageTitle.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        imageTitle.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -40).isActive = true
        downloadButton.anchor(top: nil, bottom: container.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 20, paddingBottom: 20, paddingLeft: 20, paddingRight: 20, width: 0, height: 40)
    }
}

// MARK: objc Functions
extension ImageViewController {
    @objc fileprivate func handleDownload() {
        guard let image = UIImage(named:((image?.image)!)) else { return}
        imageController.imageDownload(image: image)
    }
    
    @objc fileprivate func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
