//
//  SearchViewController.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 1/30/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    var stackView = UIStackView()
    var searchBar : UITextField = {
        let textSize:CGFloat = 36
        let textField = UITextField()
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        let attributedText = NSMutableAttributedString(string: "SEARCH", attributes: [NSAttributedString.Key.foregroundColor : UIColor.themeGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: textSize)])
        textField.attributedPlaceholder = attributedText
        textField.font = UIFont.systemFont(ofSize: textSize)
        textField.textColor = UIColor.themeBlack
        textField.textAlignment = .left
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.themeGray
        button.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.setTitle("Search", for: .normal)
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setupUIView()
        setupKeyboardDismissal()
        setupWhiteNavBar()
        self.stackView.fadeIn(0.5, delay: 0) { (done) in
            print("Done")
        }
    }
}

// MARK: keyboard functions
extension SearchViewController {
    func setupKeyboardDismissal() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textCount = textField.text?.count else { return true }
        print(textCount)
        if textCount+1 >= 3 {
            button.backgroundColor = UIColor.themeBlack
            button.isEnabled = true

        } else  {
            button.backgroundColor = UIColor.themeGray
            button.isEnabled = false
        }
        return true
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let height = (keyboardSize.size.height/3)
            self.view?.transform = CGAffineTransform(translationX: 0, y: -height)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view?.transform = .identity
    }
    
    @objc fileprivate func handleSearch() {
        print(searchBar.text)
        dismissKeyboard()
    }
    
    @objc fileprivate func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
}

// MARK: UI Functions
extension SearchViewController {
    fileprivate func setupUIView() {
        let dismissIcon = UIImage(named: "dismiss")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: dismissIcon, style: .plain, target: self, action: #selector(handleDismiss))
        view.backgroundColor = .white
        let panGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(panGesture)
        stackView = UIStackView(arrangedSubviews: [searchBar,button])
        stackView.alpha = 0
        stackView.axis = .vertical
        stackView.distribution = .fill
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: view.frame.width-40).isActive = true
    }
}

// MARK: MISC
extension SearchViewController {
    @objc fileprivate func handleDismiss(){
        self.dismiss(animated: true, completion: nil)
    }
}
