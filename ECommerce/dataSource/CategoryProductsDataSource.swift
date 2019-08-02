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
                    print(products.products.lastPage!)
                    print(products.products.currentPage!)
                    self.delegate.onSuccess(categoryProducts: products.products.data, maxPage: Int(products.products.lastPage))
                }
            }catch let error{
                print(error)
            }
        }
    }
}
