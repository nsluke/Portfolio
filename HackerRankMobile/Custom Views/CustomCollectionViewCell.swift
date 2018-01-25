//
//  CollectionViewCell.swift
//  
//
//  Created by Luke Solomon on 4/1/17.
//
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect.init(x: contentView.frame.minX, y: contentView.frame.minY, width: imageView.frame.width, height: contentView.frame.height)
        gradient.colors = [UIColor.clear.cgColor, UIColor.darkGray.cgColor]

        gradient.cornerRadius = 8
            
        self.imageView.layer.addSublayer(gradient)
        
        self.imageView.layer.cornerRadius = 8
        self.contentView.layer.cornerRadius = 8
    }

}

extension UIImageView {
    
}
