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
    let photos = ["nomadElCaptan", "nomadGlacier", "nomadLostCoast", "nomadSanoma", "nomadTheSurf"]
    let menuWidth: CGFloat = 200
    let menuView = MenuViewController()
    var isMenuOpen: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupWhiteNavBar()
        setNavBarAttributes()
        setupMenuViewController()
        view.backgroundColor = .white
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

// MARK: UI Functions
extension HomeViewController {
    fileprivate func setNavBarAttributes() {
        let menuIcon = UIImage(named: "menu")
        let searchIcon = UIImage(named: "search")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuIcon, style: .plain, target: self, action: #selector(handleMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: searchIcon, style: .plain, target: self, action: #selector(handleSearch))
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
        if isMenuOpen {
            performAnimations(transform: .identity)
            isMenuOpen = false
        } else {
            performAnimations(transform: CGAffineTransform(translationX: self.menuWidth, y: 0))
            isMenuOpen = true
        }
    }
    
    
    func setupMenuViewController() {
        let keyWindow = UIApplication.shared.keyWindow
        menuView.modalPresentationStyle = .overCurrentContext
        menuView.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: view.frame.height)
        keyWindow?.addSubview(menuView.view)
        addChild(menuView)
    }
    
    func performAnimations(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.navigationController?.view.transform = transform // Set if you want to move the entire view with menu
            self.menuView.view.transform = transform
        })
    }
}

// MARK: UICollectionView Functions
extension HomeViewController {
    fileprivate func setupCollectionView() {
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
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = view.frame.height
        return CGSize(width: width, height: height/2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
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

