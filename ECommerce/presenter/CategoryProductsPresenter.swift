//
//  CategoryProductsPresenter.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/31/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation

protocol CategoryProductsViewDelegate: BasicViewDelegate {
    func onSuccess(categoryProducts: [ProductItem], maxPage: Int)
}

class CategoryProductsPresenter: CategoryProductsPresenterDelegate{
    var service: CategoryProductsDataSource!
    var view: CategoryProductsViewDelegate!
    
    init(view: CategoryProductsViewDelegate) {
        self.service = CategoryProductsDataSource(presenter: self)
        self.view = view
    }
    
    func getProdcts(forCategory categoryId: Int, page: Int = 1){
        view.showLoading()
        service.getCategoryProducts(categoryId: categoryId, page: page)
    }
    
    func onSuccess(categoryProducts: [ProductItem], maxPage: Int) {
        view.hideLoading()
        view.onSuccess(categoryProducts: categoryProducts, maxPage: maxPage)
    }
    
    func onFailure(message: String) {
        view.hideLoading()
        view.showError(message: message)
    }

}
