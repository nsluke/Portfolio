//
//  RealmHelper.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 4/1/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import Foundation
import RealmSwift



class RealmHelper: Object {
    
    dynamic var title = ""

    static func addRealmObject(realmHelper: RealmHelper) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmHelper)
        }
    }
    
    static func deleteRealmObject(realmHelper: RealmHelper) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(realmHelper)
        }
    }
    
    static func updateRealmObject(realmHelperToBeUpdated: RealmHelper, realmHelper: RealmHelper) {
        let realm = try! Realm()
        try! realm.write() {
            realmHelperToBeUpdated.title = realmHelperToBeUpdated.title
        }
    }
    
    static func retrieveRealmObjects() -> Results<RealmHelper> {
        let realm = try! Realm()
        return realm.objects(RealmHelper.self)
    }
    
}
