//
//  GalleryViewController.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 2/1/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var photos : [Image]?
    var imageGallery : ImageGallery? {
        didSet {
            guard let imageGallery = self.imageGallery else { return }
            photos = imageGallery.images
            navigationItem.title = imageGallery.title
        }
    }

    lazy var collectionView:  UICollectionView = {
        let layout = StretchyHeaderLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWhiteNavBar()
        setupCollectionViewAttributes()
    }
}
// MARK: UI Functions
extension GalleryViewController {
    fileprivate func setupCollectionViewAttributes() {
        
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.register(ImageCellNoPadding.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    @objc fileprivate func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}


// MARK: UICollectionView Functions
extension GalleryViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = photos?.count else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width/3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageCellNoPadding
        guard let image =  photos?[indexPath.item].image else { return UICollectionViewCell()}
        cell.imageView.image = UIImage(named: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageView = ImageViewController()
        let navImageView = UINavigationController(rootViewController: imageView)
        guard let image = photos?[indexPath.item] else { return }
        imageView.image = image
        self.present(navImageView, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
