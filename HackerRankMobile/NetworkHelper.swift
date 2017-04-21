//
//  NetworkHelper.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 4/1/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import Foundation
import Alamofire

class NetworkHelper {
    
    static let sharedInstance = NetworkHelper()

    
    func getUserProfileInfo () {
        
        
        Alamofire.request("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=662FAD1E88064DA3142482D9E452EBAE&steamids=76561197965805643").responseJSON { response in
//            print(response.request)  // original URL request
//            print(response.response) // HTTP URL response
//            print(response.data ?? User) // server data
            print(response.result as Any)   // result of response serialization
        
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "setupView"),
                                                object: nil,
                                                userInfo:JSON as? [AnyHashable : Any])
            }
            
            
        }
    }
    
    
    
    
    
    
}
