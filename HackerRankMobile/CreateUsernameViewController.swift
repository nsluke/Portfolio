//
//  CreateUsernameViewController.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 6/26/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    
    @IBOutlet weak var createUsernameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        UserService.create(FirebaseUser, username: createUsernameLabel.text) { (user) in
            guard let user = user else {
                // handle error
                return
            }
            
            FirebaseUser.setCurrent(user, writeToUserDefaults: true)
            
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }
}
