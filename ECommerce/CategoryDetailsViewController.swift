//
//  CategoryDetailsViewController.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/31/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView
import FloatingPanel
import SwiftEventBus

protocol FilterDataArrival {
    func onDataArrival(data: FilterDataModel)
}

class CategoryDetailsViewController: UIViewController {
    
    var category: TopCategory!
    var categoryProducts = [ProductItem]()
    var loadingInicator: NVActivityIndicatorView!
    var presenter: CategoryProductsPresenter!
    var onFilterData: FilterDataArrival!
    var currentPage: Int =  1
    var maxPage = 0
    var fpc: FloatingPanelController!
    
    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var categoryNameLabel: PaddingLabel!
    @IBOutlet var categoryProductsCollectionView: UICollectionView!
    @IBOutlet var sortByView: UIView!
    @IBOutlet var filterView: UIView!
    @IBOutlet var filter: UIView!
    @IBOutlet var sortBy: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        
        SwiftEventBus.onMainThread(self, name: "CategoryDetailsViewController") { (result) in
            if let data = result?.object as? filterParams{
                self.presenter.getProdcts(forCategory: self.category.id, subCategoryId: data.subCategoryId, brandId: data.brandId, minPrice: data.minPrice, maxPrice: data.maxPrice)
            }
            
            if let sortBy = result?.object as? String{
                print(sortBy)
            }
            
        }
        
        navigationBar.topItem?.title = category.nameEn!
        let imageURL = URL(string: "https://e-commerce-dev.intcore.net/\(category.image!)")
        categoryImageView.sd_setImage(with: imageURL, completed: nil)
        categoryNameLabel.text = category.nameEn!
        categoryNameLabel.layer.borderColor = UIColor.white.cgColor
        categoryNameLabel.layer.borderWidth = 5.0
        
        let midX = self.categoryProductsCollectionView.frame.size.width/2
        let midY = self.categoryProductsCollectionView.frame.size.height/2
        loadingInicator = NVActivityIndicatorView(frame: CGRect(x: midX - 40.0, y: midY - 40.0, width:80.0, height:80.0), type: .ballScale, color: UIColor.blue, padding: NVActivityIndicatorView.DEFAULT_PADDING )
        self.categoryProductsCollectionView.addSubview(loadingInicator)
        
        presenter = CategoryProductsPresenter(view: self)
        presenter.getProdcts(forCategory: category.id)
        
        categoryProductsCollectionView.delegate = self
        categoryProductsCollectionView.dataSource = self
        
        
        
        
        fpc = FloatingPanelController()
        fpc.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showFilterFloatingPanel))
        filter.addGestureRecognizer(tapGesture)
        
        let tapGestureForSort = UITapGestureRecognizer(target: self, action: #selector(showSortByFloatingPanel))
        sortBy.addGestureRecognizer(tapGestureForSort)
    
    }
    
    func registerNib(){
        
        
        let nib = UINib(nibName: ItemCollectionViewCell.nibName, bundle: nil)
        categoryProductsCollectionView?.register(nib, forCellWithReuseIdentifier: ItemCollectionViewCell.reuseIdentifier)
        if let flowLayout = self.categoryProductsCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.estimatedItemSize = CGSize(width: 160, height: 220)
        }        
        
    }
    
    @IBAction func dismissController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func showFilterFloatingPanel(){
        fpc.dismiss(animated: true, completion: nil)
        let filterVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        onFilterData = filterVC
        fpc.set(contentViewController: filterVC)
        self.present(fpc, animated: true, completion: nil)
        presenter.getFilterData(forProduct: category.id)
    }
    
    @objc func showSortByFloatingPanel(){
        fpc.dismiss(animated: true, completion: nil)
        let sortByVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sortByTableView") as! SortTableViewController
        fpc.set(contentViewController: sortByVC)
        self.present(fpc, animated: true, completion: nil)
    }

}


extension CategoryDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.reuseIdentifier, for: indexPath) as! ItemCollectionViewCell
        let category = categoryProducts[indexPath.row]
        cell.configureCell(url: category.defaultImage, isFav: category.isFav, name: category.nameEn, price: category.price, productId: category.id)
        if(categoryProducts.count - 2 == indexPath.row){
            if( currentPage < maxPage){
                currentPage = currentPage + 1
                presenter.getProdcts(forCategory: self.category.id, page: currentPage)
            }
        }
        
        return cell
    }
    
}


extension CategoryDetailsViewController: CategoryProductsViewDelegate{
    func onSuccess(categoryProducts: [ProductItem],  maxPage: Int) {
        self.maxPage = maxPage
        self.categoryProducts.append(contentsOf: categoryProducts)
        self.categoryProductsCollectionView.reloadData()
    }
    
    func onFilterData(filter: FilterDataModel) {
        if let fil = onFilterData{
            fil.onDataArrival(data: filter)
        }
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



extension CategoryDetailsViewController: FloatingPanelControllerDelegate{
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Remove the views managed by the `FloatingPanelController` object from self.view.
        fpc.removePanelFromParent(animated: true)
    }
}

