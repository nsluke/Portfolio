//
//  DetailViewController.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 4/1/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit
import CoreData

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
        
        user = CoreDataHelper.retrieveUser()[0]
        setupView()
//
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        nameLabel.text =
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isToolbarHidden = false
    }
    
    func setupView() {
        user = CoreDataHelper.retrieveUser()[0]
        
        if let user = user {
            nameLabel.text = user.name
        } else {
            nameLabel.text = ""
        }
        
//        profilePhotoImageView.photo 
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
