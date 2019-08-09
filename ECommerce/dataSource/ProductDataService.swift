//
//  ProductDataService.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 8/8/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ProductPresenterDelegate: BasicPresenterDelegate {
    func onGetProduct(product: ProductItem)
}

class ProductDataService{
    var delegate: ProductPresenterDelegate!
    
    init(delegate: ProductPresenterDelegate) {
        self.delegate = delegate
    }
    
    func getProduct(productId: Int, apiToken: String = ""){
        let url = "\(Networking.BASE_URL)api/v1/user/app/product/\(productId)";
        //let params: [String: Any] = ["category_id": categoryId, "page": page]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Networking.basicHeaders)
            .responseJSON { (response) in
                do{
                    let json =  try JSON(data: response.data!)
                    if(response.response?.statusCode == 422){
                        let jsonErrors = json.dictionaryObject!
                        let masterError = MasterError(fromDictionary: jsonErrors)
                        self.delegate?.onFailure(message: masterError.errors[0].message)
                    }else{
                        let productJson = json.dictionaryObject
                        let product = ProductItem(fromDictionary: productJson!)
                        self.delegate.onGetProduct(product: product)
                    }
                }catch let error{
                    print(error)
                }
        }
    }
}
