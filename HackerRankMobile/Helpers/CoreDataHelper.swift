//
//  CoreDataHelper
//  HackerRankMobile
//
//  Created by Luke Solomon on 4/1/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit
import CoreData
import SwiftyJSON

class CoreDataHelper {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    

    static func saveUser(WithProfilePicture profilePictureURL:String, name:String, coverPhotoURL:String) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: managedContext) as! User
        
        user.profilePictureURL = profilePictureURL
        user.name = name
        user.coverPhotoURL = coverPhotoURL
        
        self.save()
    }
    
    static func saveUser(withJson json:JSON) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: managedContext) as! User

        user.name = json["realname"].stringValue
        user.coverPhotoURL = json["avatar"].stringValue
        user.profilePictureURL = json["avatarfull"].stringValue
        
        self.save()
    }
    
    static func save() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    static func delete(user: User) {
        managedContext.delete(user)
        self.save()
    }
    
    static func retrieveUser(completion: @escaping([User]) -> Void) {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            completion(results)
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
    }
    
}
