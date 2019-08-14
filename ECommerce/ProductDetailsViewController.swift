
//
//  ProductDetailsViewController.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 8/5/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import Cosmos
import SDWebImage
import NVActivityIndicatorView
import FloatingPanel

class ProductDetailsViewController: UIViewController {

    var productId: Int!
    var product: ProductItem!
    var productImages = [Image]()
    var presenter: ProductPresenter!
    var loadingInicator: NVActivityIndicatorView!
    var selectedImageIndex: Int!
    var fpc: FloatingPanelController!
    
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var mainProductImage: UIImageView!
    @IBOutlet var likeImageView: UIImageView!
    @IBOutlet var backButton: UIBarButtonItem!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var rating: CosmosView!
    @IBOutlet var price: UILabel!
    @IBOutlet var categoryInfoLabel: UILabel!
    @IBOutlet var brandInfoLabel: UILabel!
    @IBOutlet var subImageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        subImageCollectionView.dataSource = self
        subImageCollectionView.delegate = self
        
        
        
        let midX = self.view.frame.size.width/2
        let midY = self.view.frame.size.height/2
        loadingInicator = NVActivityIndicatorView(frame: CGRect(x: midX - 40.0, y: midY - 40.0, width:80.0, height:80.0), type: .ballScale, color: UIColor.blue, padding: NVActivityIndicatorView.DEFAULT_PADDING )
        self.view.addSubview(loadingInicator)
        
        presenter = ProductPresenter(view: self)
        presenter.getProduct(productId: productId!)
        
        
    }
    

    @IBAction func goBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func addToCart(_ sender: Any) {
        if let productData = product{
            fpc = FloatingPanelController()
            fpc.delegate = self
            fpc.isRemovalInteractionEnabled = true
            let specificationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "speceficationViewController") as! ProductSpecificsViewController
            specificationVC.sizes = productData.sizes
            specificationVC.colors = productData.colors
            specificationVC.productId = productData.id
            fpc.set(contentViewController: specificationVC)
            self.present(fpc, animated: true, completion: nil)
        }
        
    }
    
}

extension ProductDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = subImageCollectionView.dequeueReusableCell(withReuseIdentifier:
            "productSubImageCell", for: indexPath) as! SubImageCollectionViewCell
        let stringUrl: String = "https://e-commerce-dev.intcore.net/"+self.productImages[indexPath.row].image
        let url = URL(string: stringUrl)
        cell.minorProductImageView.sd_setImage(with: url, completed: nil)
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        return cell
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        
        let location = sender.location(in: self.subImageCollectionView)
        let indexPath = self.subImageCollectionView.indexPathForItem(at: location)
        
        if let index = indexPath {
            let stringUrl: String = "https://e-commerce-dev.intcore.net/"+self.productImages[index.row].image
            let url = URL(string: stringUrl)
            self.mainProductImage.sd_setImage(with: url, completed: nil)
        }
    }
}

extension ProductDetailsViewController: ProductViewDelegate{
    func onGetProduct(product: ProductItem) {
        self.product = product
        let urlString = "https://e-commerce-dev.intcore.net/\(product.defaultImage!)"
        let url = URL(string: urlString)
        mainProductImage.sd_setImage(with: url, completed: nil)
        let image = product.isFav ? UIImage(named: "likeRed") :UIImage(named: "like")
        likeImageView.image = image
        price.text = "$\(product.price!)"
        rating.rating = Double(product.totalRate!)
        productImages.append(contentsOf: product.images)
        categoryInfoLabel.text = "Category: \(product.subcategory.category.nameEn!)"
        if let brand = product.brand{
            brandInfoLabel.text = "Brand: \(brand.nameEn!)"
        }
        navBar.topItem?.title = product.nameEn
        subImageCollectionView.reloadData()
    }
    
    func showError(message: String) {
        Alerts.showErrorAlert(view: self, title: "Error", message: message)
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


extension ProductDetailsViewController: FloatingPanelControllerDelegate{
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
    
    func floatingPanelDidEndDragging(_ vc: FloatingPanelController, withVelocity velocity: CGPoint, targetPosition: FloatingPanelPosition) {
        if(targetPosition == .tip){
            fpc.dismiss(animated: true, completion: nil)
            fpc.removeFromParent()
        }
    }
}
