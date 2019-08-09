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
    var category: Category!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        categoryLabel.layer.borderColor = UIColor.white.cgColor
        categoryLabel.layer.borderWidth = 5.0
        
        
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
    
    func configureCell(category: Category){
        self.category = category
        let url = URL(string: "https://e-commerce-dev.intcore.net/\(category.image!)")
        categoryImageView.sd_setImage(with: url, completed: nil)
        categoryLabel.text = category.nameEn
    }
    
    
}
