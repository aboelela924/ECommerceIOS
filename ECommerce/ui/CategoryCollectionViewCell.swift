//
//  CategoryCollectionViewCell.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/27/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    class var reuseIdentifier: String {
        return "categoryCollectionViewCellReuseIdentifier"
    }
    class var nibName: String {
        return "CategoryCollectionViewCell"
    }
    
    func configureCell(imageUrl: String, categoryName: String){
        let url = URL(string: "https://e-commerce-dev.intcore.net/\(imageUrl)")
        categoryImageView.sd_setImage(with: url, completed: nil)
        categoryLabel.text = categoryName
    }
}
