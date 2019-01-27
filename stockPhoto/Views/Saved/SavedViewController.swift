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
    let photos = ["nomadElCaptan", "nomadGlacier", "nomadLostCoast", "nomadSanoma", "nomadTheSurf", "blueocean", "liberty", "margaret", "mountain","snowy"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWhiteNavBar()
        setupCollectionViewUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.collectionView.alpha = 1
        UIView.animate(withDuration: 0.5, animations: {
            self.collectionView.alpha = 0
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.collectionView.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.collectionView.alpha = 1
        })
    }
}

// MARK: UICollectionView Functions
extension SavedViewController {
    fileprivate func setupCollectionViewUI() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.register(SavedCell.self, forCellWithReuseIdentifier: cellId)
        navigationItem.title = "Saved"
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.safeAreaLayoutGuide.layoutFrame.width/2
        return CGSize(width: width, height: width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SavedCell
        cell.imageView.image = UIImage(named: photos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
