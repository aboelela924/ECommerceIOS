//
//  CartService.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 8/14/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


protocol CartPresenterDelegate: BasicPresenterDelegate {
    func onAddToCartSuccess(masterCart: CartMaster)
    func onGetCarySuccess(masterCart: CartMaster)
}

class CartService{
    
    var delegate: CartPresenterDelegate!
    
    init(presenter: CartPresenterDelegate) {
        self.delegate = presenter
    }
    
    
    
    func addToCart(params: [String: Any]){
        let url = "\(Networking.BASE_URL)api/v1/user/app/cart/add";
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: Networking.basicHeaders)
            .response { (response) in
                do{
                    let json =  try JSON(data: response.data!)
                    if(response.response?.statusCode == 422){
                        let jsonErrors = json.dictionaryObject!
                        let masterError = MasterError(fromDictionary: jsonErrors)
                        self.delegate?.onFailure(message: masterError.errors[0].message)
                    }else{
                        let cart = json.dictionaryObject
                        let masterCart = CartMaster(fromDictionary: cart!)
                        self.delegate.onAddToCartSuccess(masterCart: masterCart)
                    }
                }catch let error{
                    print(error)
                }
        }
    }
}

