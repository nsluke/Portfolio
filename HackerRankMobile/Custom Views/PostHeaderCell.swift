//
//  PostHeaderCell.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 11/29/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
    
    static let height: CGFloat = 54

    @IBOutlet weak var usernameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func optionsButtonTapped(_ sender: Any) {
        
        
        print("options button tapped")

    }
    

}
