//
//  CartPresenter.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 8/13/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation

protocol CartViewDelegate: BasicViewDelegate {
    func onAddToCartSuccess(masterCart: CartMaster)
    func onGetCartSuccess(masterCart: CartMaster)
}

class CartPresenter: CartPresenterDelegate {
    
    var view: CartViewDelegate!
    var service: CartService!
    
    init(view: CartViewDelegate) {
        service = CartService(presenter: self)
        self.view = view
    }
    
    func addToCart(params: [String: Any]){
        view.showLoading()
        service.addToCart(params: params)
    }
    
    func onAddToCartSuccess(masterCart: CartMaster) {
        view.hideLoading()
        view.onAddToCartSuccess(masterCart: masterCart)
    }
    
    func onGetCarySuccess(masterCart: CartMaster) {
        view.hideLoading()
        view.onGetCartSuccess(masterCart: masterCart)
    }
    
    func onFailure(message: String) {
        view.hideLoading()
        view.showError(message: message)
    }
    
    
}
