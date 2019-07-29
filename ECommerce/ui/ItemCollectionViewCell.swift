//
//  ItemCollectionViewCell.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/27/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView


class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet var likeImageView: UIImageView!
    @IBOutlet var itemImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    var delegate: ItemCollectionViewCellDelegate!
    var productId: Int!
    var loadingInicator: NVActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let midX = likeImageView.frame.size.width/2
        let midY = likeImageView.frame.size.height/2
        loadingInicator = NVActivityIndicatorView(frame: CGRect(x: midX - 10.75, y: midY - 10.75, width:21.5, height:21.5), type: .ballScale, color: UIColor.black, padding: NVActivityIndicatorView.DEFAULT_PADDING )
        self.likeImageView.addSubview(loadingInicator)
        hideLoading()
    }
    
    class var reuseIdentifier: String {
        return "itemCollectionViewCellReuseIdentifier"
    }
    class var nibName: String {
        return "ItemCollectionViewCell"
    }
    
    func configureCell(url: String, isFav: Bool, name: String, price: Int, productId: Int){
        self.productId = productId
        let imageUrl = URL(string: "https://e-commerce-dev.intcore.net/\(url)")
        self.itemImageView.sd_setImage(with: imageUrl, completed: nil)
        let image = isFav ? UIImage(named: "likeRed") : UIImage(named: "like")
        likeImageView.image = image
        let gesture = UITapGestureRecognizer(target: self, action: #selector(likePress))
        likeImageView.isUserInteractionEnabled = true
        likeImageView.addGestureRecognizer(gesture)
        nameLabel.text = name
        priceLabel.text = "$\(price)"
        hideLoading()
    }
    
    @objc func likePress(){
        if let delegate = delegate{
            showLoading()
            delegate.onLikeClick(productId: self.productId)
        }
    }

    
    func showLoading() {
        loadingInicator.isHidden = false
        loadingInicator.startAnimating()
    }
    
    func hideLoading() {
        loadingInicator.isHidden = true
        loadingInicator.stopAnimating()
    }
    
}
