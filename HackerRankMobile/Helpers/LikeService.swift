//
//  LikedService.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 12/5/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct LikeService {
    
    static func create(for post: Post, success: @escaping (Bool) -> Void) {
        guard let key = post.key else {
            return success(false)
        }
        
        let currentUID = FirebaseUser.current.uid
        let likesRef = Database.database().reference().child("postLikes").child(key).child(currentUID)
        likesRef.setValue(true) { (error, _) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return success(false)
            }
        }
        
        return success(true)
    }
    
    static func delete(for post: Post, success: @escaping (Bool) -> Void) {
        guard let key = post.key else {
            return success(false)
        }
        
        let currentUID = FirebaseUser.current.uid
        let likesRef = Database.database().reference().child("postLikes").child(key).child(currentUID)
        likesRef.setValue(nil) { (error, _) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return success(false)
            }
        }
        
        return success(true)
        
        
    }
    
}
