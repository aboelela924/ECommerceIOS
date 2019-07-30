//
//  HomeViewController.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/27/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
protocol ItemCollectionViewCellDelegate {
    func onLikeClick(productId: Int)
}

class HomeViewController: UIViewController, GetHomeDataViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    var loadingInicator: NVActivityIndicatorView!
    var presenter: GetHomeDataPresenter!
    var user: User!
    var newArrival = [ProductItem]()
    var bestSeller = [ProductItem]()
    var topCategories = [TopCategory]()
    
    @IBOutlet var newArrivalCollectionView: UICollectionView!
    @IBOutlet var bestSellerCollectionView: UICollectionView!
    @IBOutlet var topCategoriesCollectionView: UICollectionView!
    @IBOutlet var moreCategoriesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newArrivalCollectionView.delegate = self
        newArrivalCollectionView.dataSource = self
        
        bestSellerCollectionView.delegate =  self
        bestSellerCollectionView.dataSource = self
        
        topCategoriesCollectionView.delegate = self
        topCategoriesCollectionView.dataSource = self
        registerItemNib()

        let midX = self.view.frame.size.width/2
        let midY = self.view.frame.size.height/2
        loadingInicator = NVActivityIndicatorView(frame: CGRect(x: midX - 40.0, y: midY - 40.0, width:80.0, height:80.0), type: .ballScale, color: UIColor.blue, padding: NVActivityIndicatorView.DEFAULT_PADDING )
        self.view.addSubview(loadingInicator)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.dismissKeyboard(_:)))
        gesture.numberOfTapsRequired = 1;
        view.addGestureRecognizer(gesture)
        
        
        let showCategoreisGesture = UITapGestureRecognizer(target: self, action: #selector(showCategories))
        moreCategoriesLabel.isUserInteractionEnabled = true
        moreCategoriesLabel.addGestureRecognizer(showCategoreisGesture)
        presenter = GetHomeDataPresenter(view: self)
        if(user == nil){
            presenter.getHomeData()
        }else{
            presenter.getHomeData(apiToken: user.apiToken)
        }
    }
    
    @objc func showCategories(){
        performSegue(withIdentifier: "showCategories", sender: self)
    }
    
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer){
        view.endEditing(true)
    }

    func onSuccess(date: HomeData) {
        
        let bestSeller: [ProductItem] = date.bestSeller
        self.bestSeller.append(contentsOf: bestSeller)
        self.bestSellerCollectionView.reloadData()
        
        
        let newArrival: [ProductItem] = date.newArrival
        self.newArrival.append(contentsOf: newArrival)
        self.newArrivalCollectionView.reloadData()
        
        let topCategories : [TopCategory] = date.topCategories
        self.topCategories.append(contentsOf: topCategories)
        self.topCategoriesCollectionView.reloadData()
        
        self.view.layoutIfNeeded()
    }
    
    func onImageAddedToFavourite(productId: Int) {
        for productItem in bestSeller {
            if(productItem.id == productId){
                productItem.isFav = !productItem.isFav
            }
        }
        
        for productItem in newArrival {
            if(productItem.id == productId){
                productItem.isFav = !productItem.isFav
            }
        }
        
        newArrivalCollectionView.reloadData()
        bestSellerCollectionView.reloadData()
    }
    
    func showError(message: String) {
        Alerts.showErrorAlert(view: self, title: "Error", message: "Could not fetch data from the server")
    }
    
    func showLoading() {
        loadingInicator.isHidden = false
        loadingInicator.startAnimating()
    }
    
    func hideLoading() {
        loadingInicator.isHidden = true
        loadingInicator.stopAnimating()
    }
    
    func registerItemNib() {
        let nib = UINib(nibName: ItemCollectionViewCell.nibName, bundle: nil)
        
        
        newArrivalCollectionView?.register(nib, forCellWithReuseIdentifier: ItemCollectionViewCell.reuseIdentifier)
        if let flowLayout = self.newArrivalCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 160, height: 220)
        }
        
        bestSellerCollectionView?.register(nib, forCellWithReuseIdentifier: ItemCollectionViewCell.reuseIdentifier)
        if let flowLayout = self.bestSellerCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.estimatedItemSize = CGSize(width: 160, height: 220)
        }
        
        let nib2 = UINib(nibName: CategoryCollectionViewCell.nibName, bundle: nil)
        
        topCategoriesCollectionView?.register(nib2, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
        if let flowLayout = self.topCategoriesCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.estimatedItemSize = CGSize(width: 380, height: 120)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == newArrivalCollectionView){
            return newArrival.count
        }else if(collectionView == bestSellerCollectionView){
            return bestSeller.count
        }else{
            return topCategories.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == newArrivalCollectionView){
            if let cell = newArrivalCollectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.reuseIdentifier, for: indexPath) as? ItemCollectionViewCell{
                let item = newArrival[indexPath.row]
                var name:String!
                if(item.nameEn.count >= 24){
                    name = item.nameEn.prefix(18)+"..."
                }else{
                    name = item.nameEn
                }
                cell.configureCell(url: item.defaultImage, isFav: item.isFav, name: name, price: item.price, productId: item.id)
                cell.delegate = self
                return cell
            }
        }else if(collectionView == bestSellerCollectionView){
            if let cell = newArrivalCollectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.reuseIdentifier, for: indexPath) as? ItemCollectionViewCell{
                let item = bestSeller[indexPath.row]
                var name:String!
                if(item.nameEn.count >= 24){
                    name = item.nameEn.prefix(18)+"..."
                }else{
                    name = item.nameEn
                }
                cell.configureCell(url: item.defaultImage, isFav: item.isFav, name: name, price: item.price, productId: item.id)
                cell.delegate = self
                return cell
            }
        }else if(collectionView == topCategoriesCollectionView){
            if let cell = topCategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? CategoryCollectionViewCell{
                let item = topCategories[indexPath.row]
                cell.configureCell(imageUrl: item.image, categoryName: item.nameEn)
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showCategories"){
            let destination = segue.destination as! CategoriesTableViewController
            destination.categories.append(contentsOf: topCategories)
        }
    }

}


extension HomeViewController: ItemCollectionViewCellDelegate{
    func onLikeClick(productId: Int) {
        guard let user = user else{
            Alerts.showErrorAlert(view: self, title: "Error", message: "You can do this only if you are a user")
            return
        }
        print("clicked")
        presenter.addImageToFavourite(apiToken: user.apiToken, productId: productId)
    }
}
