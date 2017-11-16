//
//  MGPhotoHelper.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 11/9/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit
import Photos

class MGPhotoHelper: NSObject {

    // MARK: - Properties
    var completionHandler: ((UIImage) -> Void)?
    
    // MARK: - Helper Methods
    
    func presentImagePickerController(with sourceType: UIImagePickerControllerSourceType, from viewController: UIViewController) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        
        viewController.present(imagePickerController, animated: true)
    }

    
    func presentActionSheet(from viewController: UIViewController) {
        checkPermission()
        
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { [unowned self] action in
                self.presentImagePickerController(with: .camera, from: viewController)
            })
            
            alertController.addAction(capturePhotoAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { [unowned self] action in
                self.presentImagePickerController(with: .photoLibrary, from: viewController)
            })
            
            alertController.addAction(uploadAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        viewController.present(alertController, animated: true)
    }
    
    // Don't forget to go to Product > Scheme > Edit Scheme
    // In your Environment Variables create OS_ACTIVITY_MODE and for it's value set it to disable
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
            case .authorized:
                print("Access is granted by user")
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization({
                    (newStatus) in
                    print("status is \(newStatus)")
                    if newStatus ==  PHAuthorizationStatus.authorized {
                        /* do stuff here */
                        print("success")
                    }
                })
                print("It is not determined until now")
            case .restricted:
                // same same
                print("User do not have access to photo album.")
            case .denied:
                // same same
                print("User has denied the permission.")
        }
    }
    
}

extension MGPhotoHelper: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            completionHandler?(selectedImage)
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
