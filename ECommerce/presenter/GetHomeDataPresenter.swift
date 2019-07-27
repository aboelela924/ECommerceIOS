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
}
class GetHomeDataPresenter: GethomeDataPresenterDelegate {
    var view: GetHomeDataViewDelegate!
    var service: GetHomeDataService!
    
    init(view: GetHomeDataViewDelegate) {
        self.service = GetHomeDataService(delegate: self)
        self.view = view
    }
    
    func getHomeData(){
        view.showLoading()
        service.getData()
    }
    
    func onSuccess(date: HomeData) {
        view.hideLoading()
        view.onSuccess(date: date)
    }
    
    func onFailure(message: String) {
        view.hideLoading()
        view.showError(message: message)
    }
    
    
}
