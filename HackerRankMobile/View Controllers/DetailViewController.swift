//
//  DetailViewController.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 4/1/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit
import CoreData
import AFNetworking
//@class UIImageView+AFNetworking.h

class DetailViewController: UIViewController {
    
    var classTitle:String?
    var user:User?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var coverPhotoImageView: UIImageView!
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(self.setupView),
//            name: NSNotification.Name(rawValue: "setupView"),
//            object: nil)
        
        sleep(3) // find a not lazy way to do this
        user = CoreDataHelper.retrieveUser()[0]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let localUser = user {
            coverPhotoImageView.setImageWith(URL(string: (user?.coverPhotoURL)!)!)
            profilePhotoImageView.setImageWith(URL(string: (user?.profilePictureURL)!)!)
            nameLabel.text = localUser.name
        } else {
     
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isToolbarHidden = false
    }
    

    
    
}
