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
    var user = User()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var coverPhotoImageView: UIImageView!
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkHelper.getUserProfileInfo {
            CoreDataHelper.retrieveUser(completion: { (results) in
                self.user = results[0]
                self.setUpViews()
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isToolbarHidden = false
    }
    

    func setUpViews() {
        self.coverPhotoImageView.setImageWith(URL(string: (self.user.coverPhotoURL)!)!)
        
        self.profilePhotoImageView.setImageWith(URL(string: (self.user.profilePictureURL)!)!)
        
        self.nameLabel.text = self.user.name
    }
    
}


