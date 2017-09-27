//
//  FirebaseUser.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 6/26/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class FirebaseUser {
    
    // MARK: - Singleton
    private static var _current: FirebaseUser?
    
    static var current: FirebaseUser {
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }

        return currentUser
    }
    
    // MARK: - Class Methods
    static func setCurrent(_ user: FirebaseUser) {
        _current = user
    }
    
    // MARK: - Properties
    let uid: String
    let username: String
    
    // MARK: - Init
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
    }
    

}
