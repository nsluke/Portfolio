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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result = RealmHelper.retrieveRealmObjects()
//        self.title = result[0].title
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
