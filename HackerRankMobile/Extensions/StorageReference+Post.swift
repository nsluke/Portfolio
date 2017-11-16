//
//  StorageReference+Post.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 11/13/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import Foundation
import FirebaseStorage

extension StorageReference {
    static let dateFormatter = ISO8601DateFormatter()
    
    static func newPostImageReference() -> StorageReference {
        let uid = FirebaseUser.current.uid
        let timestamp = dateFormatter.string(from: Date())
        
        return Storage.storage().reference().child("images/posts/\(uid)/\(timestamp).jpg")
    }
}
