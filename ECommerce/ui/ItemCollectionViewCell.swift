//
//  ItemCollectionViewCell.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/27/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import SDWebImage

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet var likeImageView: UIImageView!
    @IBOutlet var itemImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class var reuseIdentifier: String {
        return "itemCollectionViewCellReuseIdentifier"
    }
    class var nibName: String {
        return "ItemCollectionViewCell"
    }
    
    func configureCell(url: String, isFav: Bool, name: String, price: Int){
        let imageUrl = URL(string: "https://e-commerce-dev.intcore.net/\(url)")
        self.itemImageView.sd_setImage(with: imageUrl, completed: nil)
        let image = isFav ? UIImage(named: "likeRed") : UIImage(named: "like")
        likeImageView.image = image
        nameLabel.text = name
        priceLabel.text = "$\(price)"
    }
    
    

}
