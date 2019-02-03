//
//  SavedViewController.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/27/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class SavedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    var photos : [Image] = DataController.shared.images

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.alpha = 0
        setupWhiteNavBar()
        setupCollectionViewUI()
        self.collectionView.fadeIn(0.5, delay: 0) { (done) in
            print("Done")
        }
    }
}

// MARK: UICollectionView Functions
extension SavedViewController {
    fileprivate func setupCollectionViewUI() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.register(ImageCellPadding.self, forCellWithReuseIdentifier: cellId)
        navigationItem.title = "Saved"
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.safeAreaLayoutGuide.layoutFrame.width/2
        let height = collectionView.safeAreaLayoutGuide.layoutFrame.height/3
        return CGSize(width: width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageCellPadding
        cell.imageView.image = UIImage(named: photos[indexPath.item].image)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageView = ImageViewController()
        let image = photos[indexPath.item]
        imageView.image = image
        let navImageView = UINavigationController(rootViewController: imageView)
        self.present(navImageView, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
