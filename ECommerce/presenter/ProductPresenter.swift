//
//  ProductPresenter.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 8/8/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation


protocol ProductViewDelegate: BasicViewDelegate{
    func onGetProduct(product: ProductItem);
}

class ProductPresenter: ProductPresenterDelegate{
    
    var view: ProductViewDelegate!
    var service: ProductDataService!
    
    init(view: ProductViewDelegate) {
        self.view = view
        self.service = ProductDataService(delegate: self)
    }
    
    func getProduct(productId: Int ){
        view.showLoading()
        service.getProduct(productId: productId)
    }
    
    func onGetProduct(product: ProductItem) {
        view.hideLoading()
        view.onGetProduct(product: product)
    }
    
    func onFailure(message: String) {
        view.hideLoading()
        view.showError(message: message)
    }
}
