//
//  StorageService.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 11/10/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit
import FirebaseStorage


struct StorageService {
    
    static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {

        guard let imageData = UIImageJPEGRepresentation(image, 0.1) else {
            return completion(nil)
        }
        

        reference.putData(imageData, metadata: nil, completion: { (metadata, error) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            completion(metadata?.downloadURL())
        })
    }
    
}
