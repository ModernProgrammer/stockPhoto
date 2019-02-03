//
//  ImageController.swift
//  stockPhoto
//
//  Created by Diego Bustamante on 2/3/19.
//  Copyright © 2019 Diego Bustamante. All rights reserved.
//

import UIKit

class ImageController: UIViewController {
    static let shared = ImageController()
    
    func imageDownload(image : UIImage) {
        print("Download image")
        UIImageWriteToSavedPhotosAlbum(image, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil, nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let alertController = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(alertController, animated: true)
        } else {
            let alertController = UIAlertController(title: "Saved!", message: "Your image has been saved to your photos.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(alertController, animated: true)
        }
    }
}
