//
//  SubcategoryCollectionViewCell.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 8/2/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit

class SubcategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet var subcategoryLabel: PaddingLabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        subcategoryLabel.layer.borderColor = UIColor.black.cgColor
        subcategoryLabel.layer.borderWidth = 1.0
    }

    class var reuseIdentifier: String {
        return "SubcategoryCollectionViewCellReuseIdentifier"
    }
    class var nibName: String {
        return "SubcategoryCollectionViewCell"
    }
    
    func configureCell(subcategoryName: String){
        subcategoryLabel.text = subcategoryName
    }
    
}
