//
//  CategoryTableViewCell.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/29/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        categoryLabel.layer.borderColor = UIColor.white.cgColor
        categoryLabel.layer.borderWidth = 5.0
        categoryLabel.frame.inset(by: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15))
        categoryLabel.layoutIfNeeded()
    }

    class var reuseIdentifier: String {
        return "CategoryTableViewCellReuseIdentifier"
    }
    class var nibName: String {
        return "CategoryTableViewCell"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(imageUrl: String, categoryName: String){
        let url = URL(string: "https://e-commerce-dev.intcore.net/\(imageUrl)")
        categoryImageView.sd_setImage(with: url, completed: nil)
        categoryLabel.text = categoryName
    }
    
}
