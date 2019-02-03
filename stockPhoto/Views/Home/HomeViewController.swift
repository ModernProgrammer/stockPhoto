//
//  HomeViewController.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/27/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    let headerId = "headerId"
    var imageGallery : [ImageGallery]?
    let menuWidth: CGFloat = 200
    let menuView = MenuViewController()
    let imageController = DataController.shared
    var isMenuOpened: Bool = false
    let velocityThreshold: CGFloat = 500
    let darkCoverView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        imageGallery = imageController.imageGallery
        self.collectionView.alpha = 0
        setupCollectionView()
        setupWhiteNavBar()
        setNavBarAttributes()
        setupMenuViewController()
        setupDarkCoverView()
        self.collectionView.fadeIn(0.5, delay: 0) { (done) in
            print("Done")
        }
    }
}

// MARK: UI Functions
extension HomeViewController {
    fileprivate func setNavBarAttributes() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.menuIcon!, style: .plain, target: self, action: #selector(handleMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.searchIcon!, style: .plain, target: self, action: #selector(handleSearch))
    }
    
    @objc fileprivate func handleSearch() {
        print("handleSearch")
        let searchView = SearchViewController()
        let navView = UINavigationController(rootViewController: searchView)
        self.present(navView, animated: true)
    }
    
    @objc fileprivate func handleMenu() {
        print("Menu Press")
        // show menu view
        if isMenuOpened {
            performAnimations(transform: .identity)
            isMenuOpened = false
        } else {
            performAnimations(transform: CGAffineTransform(translationX: self.menuWidth, y: 0))
            isMenuOpened = true
        }
    }
    
    func setupMenuViewController() {
        let keyWindow = UIApplication.shared.keyWindow
        menuView.modalPresentationStyle = .overCurrentContext
        menuView.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: view.frame.height)
        keyWindow?.addSubview(menuView.view)
        addChild(menuView)
    }
    

    
    fileprivate func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        if gesture.state == .changed {
            var x = translation.x
            if isMenuOpened {
                x += menuWidth
            }
            x = min(view.frame.maxX, x)
            x = max(menuWidth, x)
            let transform = CGAffineTransform(translationX: x, y: 0)
            menuView.view.transform = transform
        } else if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    @objc func handleOpenMenu() {
        isMenuOpened = true
        performAnimations(transform: CGAffineTransform(translationX: self.menuWidth, y: 0))
    }
    
    func handleCloseMenu() {
        isMenuOpened = false
        performAnimations(transform: .identity)
    }
    
    func handleEnded(gesture: UIPanGestureRecognizer){
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        if isMenuOpened {
            if  velocity.x > velocityThreshold {
                handleCloseMenu()
                return
            }
            if translation.x < abs(menuWidth/2) {
                handleOpenMenu()
            } else {
                handleCloseMenu()
            }
        } else {
            if abs(velocity.x) > velocityThreshold {
                handleOpenMenu()
                return
            }
            if translation.x >  -(menuWidth/2) {
                handleCloseMenu()
            } else {
                handleOpenMenu()
            }
        }
    }
    
    func performAnimations(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.navigationController?.view.transform = transform // Set if you want to move the entire view with menu
            self.menuView.view.transform = transform
        })
    }
    
    func setupDarkCoverView() {
        darkCoverView.alpha = 0
        darkCoverView.backgroundColor = UIColor(white: 0, alpha: 0.8)
        darkCoverView.isUserInteractionEnabled = false
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(darkCoverView)
        darkCoverView.frame = mainWindow?.frame ?? .zero
    }
}

// MARK: UICollectionView Functions
extension HomeViewController {
    fileprivate func setupCollectionView() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HomeHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.width
        let height = view.frame.height
        return CGSize(width: width, height: height/1.5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HomeHeaderCell
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (imageGallery?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = view.frame.height
        return CGSize(width: width, height: height/2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
        cell.imageGallery = imageGallery![indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let galleryView = GalleryViewController()
        galleryView.imageGallery = imageGallery![indexPath.item]
        self.navigationController?.pushViewController(galleryView, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

