//
//  FilterViewController.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 8/2/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit
import RangeSeekSlider
import SwiftEventBus

class filterParams{
    var subCategoryId: String
    var brandId: String
    var maxPrice: Int
    var minPrice: Int
    
    init(subCategoryId: String, brandId: String, maxPrice: Int, minPrice: Int) {
        self.subCategoryId = subCategoryId
        self.brandId = brandId
        self.maxPrice = maxPrice
        self.minPrice = minPrice
    }
}

class FilterViewController: UIViewController, FilterDataArrival {
   
    @IBOutlet var subcategoryCollectionView: UICollectionView!
    @IBOutlet var brandsCollectionView: UICollectionView!
    @IBOutlet var priceRange: RangeSeekSlider!
    @IBOutlet var cancelLabel: UILabel!
    @IBOutlet var applyLabel: UILabel!
    
    
    var subcategoryNames = [Subcategory]()
    var brandsNames = [Brand]()
    var filterBy: [String: Int?] = ["sub_category_id": nil, "brand_id": nil, "max_price": nil, "min_price": nil]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelLabel.isUserInteractionEnabled = true
        applyLabel.isUserInteractionEnabled = true
        
        subcategoryCollectionView.delegate = self
        subcategoryCollectionView.dataSource = self
        brandsCollectionView.delegate = self
        brandsCollectionView.dataSource = self
        registerNib()
        
        let cancelTap = UITapGestureRecognizer(target: self, action: #selector(cancel))
        cancelLabel.addGestureRecognizer(cancelTap)
        
        let applyTap = UITapGestureRecognizer(target: self, action: #selector(apply))
        applyLabel.addGestureRecognizer(applyTap)
        
    }
    
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func apply(){
        //== nil ? "" : String(filterBy["sub_category_id"] as! Int)
        //== nil ? "" : String(filterBy["brand_id"] as! Int)
        var subCategoryIdString : String!
        var brandIdString: String!
        
        if let subCategoryId = filterBy["sub_category_id"]{
            subCategoryIdString = String(subCategoryId!)
        }else{
            subCategoryIdString = ""
        }
        if let brandId = filterBy["brand_id"]{
            brandIdString = String(brandId!)
        }else{
            brandIdString = ""
        }
        SwiftEventBus.post("CategoryDetailsViewController", sender: filterParams(subCategoryId: subCategoryIdString, brandId: brandIdString , maxPrice: Int(priceRange.selectedMaxValue), minPrice: Int(priceRange.selectedMinValue)))
        //SwiftEventBus.post("CategoryDetailsViewController", userInfo: filterBy)
        self.dismiss(animated: true, completion: nil)
    }
    

    func registerNib(){
        
        let subcategoryNameNib = UINib(nibName: SubcategoryCollectionViewCell.nibName, bundle: nil)
        subcategoryCollectionView?.register(subcategoryNameNib, forCellWithReuseIdentifier: SubcategoryCollectionViewCell.reuseIdentifier)
        if let flowLayout = subcategoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.estimatedItemSize = CGSize(width: 120.0, height: 40.0)
        }

         let brandsNib = UINib(nibName: BrandCollectionViewCell.nibName, bundle: nil)
        brandsCollectionView?.register(brandsNib, forCellWithReuseIdentifier: BrandCollectionViewCell.reuseIdentifier)
        if let flowLayout = brandsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.estimatedItemSize = CGSize(width: 120.0, height: 40.0)
        }
    }
    
    
    func onDataArrival(data: FilterDataModel) {
        subcategoryNames.append(contentsOf: data.subCategories)
        brandsNames.append(contentsOf: data.brands)
        priceRange.maxValue = CGFloat(integerLiteral: data.maxPrice!)
        priceRange.minValue = CGFloat(integerLiteral: data.minPrice!)
        priceRange.maxLabelColor = UIColor.black
        priceRange.minLabelColor = UIColor.black
        priceRange.colorBetweenHandles = UIColor.black
        priceRange.backgroundColor = UIColor.white
        subcategoryCollectionView.reloadData()
        brandsCollectionView.reloadData()
    }
    


}

extension FilterViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == subcategoryCollectionView){
            return subcategoryNames.count
        }
        if(collectionView == brandsCollectionView){
            return brandsNames.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == subcategoryCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubcategoryCollectionViewCell.reuseIdentifier, for: indexPath) as! SubcategoryCollectionViewCell
            cell.configureCell(subcategoryName: subcategoryNames[indexPath.row].nameEn)
            return cell
        }else if( collectionView == brandsCollectionView ){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.reuseIdentifier, for: indexPath) as! BrandCollectionViewCell
            let brand = brandsNames[indexPath.row]
            cell.configureCell(brandImage: brand.image, brandName: brand.nameEn)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == subcategoryCollectionView){
            if(filterBy["sub_category_id"] == nil || filterBy["sub_category_id"] != subcategoryNames[indexPath.row].id){
                filterBy["sub_category_id"] =  subcategoryNames[indexPath.row].id
            }else{
                filterBy["sub_category_id"] = nil
            }
            
        }else if(collectionView == brandsCollectionView){
            if(filterBy["brand_id"] == nil || filterBy["brand_id"] != brandsNames[indexPath.row].id){
                filterBy["brand_id"] = brandsNames[indexPath.row].id
            }else{
                filterBy["brand_id"] = nil
            }
        }
    }
}
