//
//  FirebaseUser.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 6/26/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class FirebaseUser: NSObject {
    
    // MARK: - Singleton
    private static var _current: FirebaseUser?
    var isFollowed = false
    
    static var current: FirebaseUser {
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }

        return currentUser
    }
    
    // MARK: - Class Methods
    static func setCurrent(_ user: FirebaseUser, writeToUserDefaults: Bool) {

        if writeToUserDefaults {
            let data = NSKeyedArchiver.archivedData(withRootObject: user)
            
            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
        }
        _current = user
    }
    
    // MARK: - Properties
    let uid: String
    let username: String
    
    // MARK: - Init
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
        
        super.init()
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let username = aDecoder.decodeObject(forKey: Constants.UserDefaults.username) as? String
            else { return nil }
        
        self.uid = uid
        self.username = username
        
        super.init()
    }

}
extension FirebaseUser: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.UserDefaults.uid)
        aCoder.encode(username, forKey: Constants.UserDefaults.username)
    }
}
