//
//  RealmHelper.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 4/1/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import Foundation
import RealmSwift



class RealmHelper {
    
    dynamic var title = ""


    
    static func addThing(thing: ThingToDo) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(thing)
        }
    }
    
    
    
}


