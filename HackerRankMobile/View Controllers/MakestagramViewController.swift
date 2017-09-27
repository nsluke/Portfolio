//
//  MakestagramViewController.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 6/13/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit
import Firebase

class MakestagramViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Login", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "InitialController") as UIViewController

        self.present(controller, animated: true, completion: nil)

//        let window: UIWindow = UIWindow()
        
//        // 2
//        if let initialViewController = storyboard.instantiateInitialViewController() {
//            // 3
//            window.rootViewController = initialViewController
//            // 4
//            window.makeKeyAndVisible()
//        }
    }
}
