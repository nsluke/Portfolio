//
//  DetailViewController.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 4/1/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var classTitle:String!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var coverPhotoImageView: UIImageView!
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let result = RealmHelper.retrieveRealmObjects()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.setupView(notification:)),
            name: NSNotification.Name(rawValue: "setupView"),
            object: nil)
        
        
        NetworkHelper.sharedInstance.getUserProfileInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        nameLabel.text =
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isToolbarHidden = false
                
    }
    
    
    func setupView(notification:NSNotification) {
        if notification.userInfo != nil {
            let response = notification.userInfo?["response"] as? [AnyHashable : Any]
            let playerObject = response!["players"] as Optional<Any>

            
            let playerArray = playerObject![0]
            
            
            nameLabel.text = playerObject!["realname"] as? String
            
        }
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
