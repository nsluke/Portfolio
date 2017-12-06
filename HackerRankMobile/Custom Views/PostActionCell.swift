//
//  PostActionCell.swift
//  HackerRankMobile
//
//  Created by Luke Solomon on 11/29/17.
//  Copyright © 2017 Solomon Stuff. All rights reserved.
//

import UIKit

protocol PostActionCellDelegate: class {
    // MARK: - Properties
    
    func didTapLikeButton(_ likeButton: UIButton, on cell: PostActionCell)
}

class PostActionCell: UITableViewCell {

    // MARK: - Properties
    static let height: CGFloat = 46
    weak var delegate: PostActionCellDelegate?

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - IBActions
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        delegate?.didTapLikeButton(sender, on: self)
    }
    
}
