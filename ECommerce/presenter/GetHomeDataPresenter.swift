//
//  GetHomeDataPresenter.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/27/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation
protocol GetHomeDataViewDelegate: BasicViewDelegate {
    func onSuccess(date: HomeData)
    func onImageAddedToFavourite(productId: Int)
    func onGetUser(user: User)
}
class GetHomeDataPresenter: GethomeDataPresenterDelegate {
    
    var view: GetHomeDataViewDelegate!
    var service: GetHomeDataService!
    
    init(view: GetHomeDataViewDelegate) {
        self.service = GetHomeDataService(delegate: self)
        self.view = view
    }
    
    func getProfile(apiToken: String){
        view.showLoading()
        service.getUser(apiToken: apiToken)
    }
    
    func getHomeData(){
        view.showLoading()
        service.getData()
    }
    
    func getHomeData(apiToken: String){
        view.showLoading()
        service.getData(apiToken: apiToken)
    }
    
    func addImageToFavourite(apiToken: String, productId: Int){
        service.likeImage(apiToken: apiToken, productId: productId)
    }
    
    func onSuccess(date: HomeData) {
        view.hideLoading()
        view.onSuccess(date: date)
    }
    
    func onFailure(message: String) {
        view.hideLoading()
        view.showError(message: message)
    }
    
    func imageAddedToFavourite(productId: Int) {
        view.onImageAddedToFavourite(productId: productId)
    }
    
    func onGetUser(user: User) {
        view.hideLoading()
        view.onGetUser(user: user)
    }
}
