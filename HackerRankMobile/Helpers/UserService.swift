//
//  UserHelper.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 6/26/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct UserService {
    static func create(_ firUser: FIRUser, username: String, completion: @escaping (FirebaseUser?) -> Void) {
        let userAttrs = ["username": username]
        
        let ref = Database.database().reference().child("users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = FirebaseUser(snapshot: snapshot)
                completion(user)
            })
        }
    }
    
    static func show(forUID uid: String, completion: @escaping (FirebaseUser?) -> Void) {
        let ref = Database.database().reference().child("users").child(uid)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let user = FirebaseUser(snapshot: snapshot)
                else { return completion(nil) }
            completion(user)
        })
    }
    
    static func posts(for user: FirebaseUser, completion: @escaping ([Post]) -> Void) {
        let ref = Database.database().reference().child("posts").child(user.uid)
//        let ref = Database.database().reference().child("posts").child("Bde9s5WCrqXulDEy8cf0NNEQRoS2")

        // Bde9s5WCrqXulDEy8cf0NNEQRoS2
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion([])
            }
            
            let posts = snapshot.reversed().flatMap(Post.init)
            completion(posts)
        })
    }
    
}
