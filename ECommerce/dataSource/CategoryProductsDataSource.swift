//
//  CategoryProductsDataSource.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/31/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


protocol CategoryProductsPresenterDelegate: BasicPresenterDelegate {
    func onSuccess(categoryProducts: [ProductItem], maxPage: Int)
    func onGategoryFilterData(filterData: FilterDataModel)
}


class CategoryProductsDataSource{
    var delegate: CategoryProductsPresenterDelegate!
    
    init(presenter: CategoryProductsPresenterDelegate) {
        delegate = presenter
    }
    
    func getCategoryProducts(categoryId: Int, page: Int = 1){
        let url = "\(Networking.BASE_URL)api/v1/user/app/products";
        let params: [String: Any] = ["category_id": categoryId, "page": page]
        print(params)
        Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: Networking.basicHeaders).responseJSON { (response) in
            do{
                let json =  try JSON(data: response.data!)
                if(response.response?.statusCode == 422){
                    let jsonErrors = json.dictionaryObject!
                    let masterError = MasterError(fromDictionary: jsonErrors)
                    self.delegate?.onFailure(message: masterError.errors[0].message)
                }else{
                    let categoryProducts = json.dictionaryObject
                    let products = CategoryProductsModel(fromDictionary: categoryProducts!)
                    self.delegate.onSuccess(categoryProducts: products.products.data, maxPage: Int(products.products.lastPage))
                }
            }catch let error{
                print(error)
            }
        }
    }
    
    
    func getCategoryDataForFilter(categoryId: Int, subCategoryId: String = "", brandId: String = "", minPrice:Int = 0,  maxPrice: Int = 100000000){
        let url = "\(Networking.BASE_URL)api/v1/user/app/get-filter"
        let params: [String: Any] = ["category_id": categoryId, "sub_category_id": subCategoryId, "brand_id": brandId, "max_price": maxPrice, "min_price": minPrice]
        Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: Networking.basicHeaders)
            .responseJSON { (response) in
                do{
                    let json =  try JSON(data: response.data!)
                    if(response.response?.statusCode == 422){
                        let jsonErrors = json.dictionaryObject!
                        let masterError = MasterError(fromDictionary: jsonErrors)
                        self.delegate?.onFailure(message: masterError.errors[0].message)
                    }else{
                        let productFilter = json.dictionaryObject
                        let filter = FilterDataModel(fromDictionary: productFilter!)
                        self.delegate.onGategoryFilterData(filterData: filter)
                    }
                }catch let error{
                    print(error)
                }
        }
    }
}
