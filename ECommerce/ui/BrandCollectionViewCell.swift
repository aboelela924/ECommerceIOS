//
//  BrandCollectionViewCell.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 8/2/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import SDWebImage

class BrandCollectionViewCell: UICollectionViewCell {

    @IBOutlet var brandLogoImageView: UIImageView!
    @IBOutlet var brandNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    class var reuseIdentifier: String {
        return "BrandCollectionViewCellReusableIdentifier"
    }
    class var nibName: String {
        return "BrandCollectionViewCell"
    }
    
    
    func configureCell(brandImage: String, brandName: String){
        let brandImageURL = URL(string: "https://e-commerce-dev.intcore.net/\(brandImage)")
        brandLogoImageView.sd_setImage(with: brandImageURL, completed: nil)
        brandNameLabel.text = brandName
    }
    
}
