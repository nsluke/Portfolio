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
import SwiftyJSON

struct NetworkHelper {
    
    static let sharedInstance = NetworkHelper()
    
    static func getUserProfileInfo(completion: @escaping() -> Void ) {
        
        Alamofire.request("https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=662FAD1E88064DA3142482D9E452EBAE&steamids=76561197965805643").responseJSON { response in
            
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let result = JSON(value)
                    let json = result["response"]["players"][0]
                    
                    CoreDataHelper.saveUser(withJson: json)
                    
                    completion()
                }
            case .failure(let error):
                print(error)
            }
            
            
        }
    }
}


