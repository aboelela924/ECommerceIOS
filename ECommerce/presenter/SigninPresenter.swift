//
//  SigninPresenter.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/25/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation

protocol SigninViewDelegate: BasicViewDelegate {
    func onSigninSuccess(user: User)
}

class SigninPresenter: SigninPresenterDelegate {
    var service: SigninService!
    var view: SigninViewDelegate!
    
    init(view: SigninViewDelegate) {
        self.service = SigninService(delegate: self)
        self.view = view
    }
    
    func signin(_ emailOrPhone: String,_ password: String ){
        view.showLoading()
        service.signin(emailOrPhone: emailOrPhone, password: password)
    }
    
    func onSigninSuccess(user: User) {
        view.hideLoading()
        view.onSigninSuccess(user: user)
        
    }
    
    func onFailure(message: String) {
        view.hideLoading()
        view.showError(message: message)
    }
    
}
