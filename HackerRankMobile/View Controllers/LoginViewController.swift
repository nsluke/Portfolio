//
//  LoginViewController.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 6/16/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit
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

        guard let authUI = FUIAuth.defaultAuthUI() else { return }
        
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}
extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
        }

        guard let user = user else { return }

        let userRef = Database.database().reference().child("users").child(user.uid)
        
        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
            if let user = FirebaseUser(snapshot: snapshot) {
                FirebaseUser.setCurrent(user)
                
                let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: .main)
                let controller = storyboard.instantiateViewController(withIdentifier: "InitialMakestagramController") as UIViewController
                
                self.present(controller, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
            }
        })
    }
}
