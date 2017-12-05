//
//  LoginViewController.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 6/16/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase


typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        print("Login Button Tapped")
        
        if let authUI = FUIAuth.defaultAuthUI() {
            authUI.delegate = self
            
            let authViewController = authUI.authViewController()
            present(authViewController, animated: true)
        }
    }
}
extension LoginViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        UserService.show(forUID: user!.uid) { (user) in
            if let user = user {
                // handle existing user
                FirebaseUser.setCurrent(user, writeToUserDefaults: true)
                
                let storyboard:UIStoryboard = UIStoryboard(name: "Makestagram", bundle: .main)
                let controller = storyboard.instantiateViewController(withIdentifier: "InitialController") as UIViewController
                self.present(controller, animated: true, completion: nil)
                
            } else {
                // handle new user
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
        }
    }
    
}
