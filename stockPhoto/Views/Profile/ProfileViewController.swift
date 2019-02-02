//
//  ProfileViewController.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/27/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let headerId = "headerId"
    let cellId = "cellId"
    let photos = ["nomadElCaptan", "nomadGlacier", "nomadLostCoast", "nomadSanoma", "nomadTheSurf", "blueocean", "liberty", "mountain","snowy", "nomadElCaptan", "nomadGlacier", "nomadLostCoast", "nomadSanoma", "nomadTheSurf", "blueocean", "liberty", "mountain","snowy"]

    
    lazy var collectionView:  UICollectionView = {
        let layout = StretchyHeaderLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInsetAdjustmentBehavior = .never
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        setupClearNavBar()
        setupCollectionView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.collectionView.alpha = 1
        self.collectionView.fadeOut(0.5, delay: 0) { (done) in
            print("Done")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.collectionView.alpha = 0
        self.collectionView.fadeIn(0.5, delay: 0) { (done) in
            print("Done")
        }
    }
}

// MARK: UICollectionView Functions
extension ProfileViewController {
    fileprivate func setupCollectionView() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.register(ImageCellNoPadding.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.width
        let height = view.frame.height/2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! ProfileHeader
            headerView.imageView.image = UIImage(named: "profile-1")
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width/3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageCellNoPadding
        cell.imageView.image = UIImage(named: photos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let view = ImageViewController()
        
        self.present(view, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
