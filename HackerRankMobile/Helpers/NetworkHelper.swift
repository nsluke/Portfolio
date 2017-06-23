//
//  NetworkHelper.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 4/1/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

class NetworkHelper {
    
    static let sharedInstance = NetworkHelper()
    
    func getUserProfileInfo () {
        Alamofire.request("https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=662FAD1E88064DA3142482D9E452EBAE&steamids=76561197965805643").responseJSON { response in
            
            let responseObj:[String:Any]  = (response.result.value as! [String:Any])["response"] as! [String : Any]
            let players = responseObj["players"] as! [AnyHashable]
            let playerObj = players[0] as! [String:Any]
            
//            let user = User()
//            
//            user.coverPhotoURL = playerObj["avatarfull"] as? String
//            user.name = playerObj["realname"] as? String
//            user.profilePictureURL = playerObj["avatar"] as? String
            
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "setupView"),
//                                            object: nil,
//                                            userInfo:players as! [AnyHashable : Any])
            
            CoreDataHelper.saveUser(WithProfilePicture: playerObj["avatarfull"] as? String,
                                    name: playerObj["realname"] as? String,
                                    coverPhotoURL: playerObj["avatar"] as? String)
            
        }
    }
}
