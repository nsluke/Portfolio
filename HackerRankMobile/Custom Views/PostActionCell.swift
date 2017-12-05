//
//  PostActionCell.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 11/29/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit

class PostActionCell: UITableViewCell {

    static let height: CGFloat = 46
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        
        
    }
    
}
