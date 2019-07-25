//
//  SignupPresenter.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/24/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation
protocol SignupViewDelegate: BasicViewDelegate {
    func signupSuccess(user: User)
}

class SignupPresenter: SignupPresenterDelegate{
    
    private var service: SignupService?
    private var view: SignupViewDelegate?
    
    init( view: SignupViewDelegate) {
        self.service = SignupService(delegate: self)
        self.view = view
    }
    
    public func signup(name: String, email: String, phoneNumber: String, password: String){
        view?.showLoading()
        service?.signup(name: name, email: email, phoneNumber: phoneNumber, password: password)
    }
    
    public func onSignupSuccess(user: User){
        view?.hideLoading()
        view?.signupSuccess(user: user)
    }
    
    public func onFailure(message: String){
        view?.hideLoading()
        view?.showError(message: message)
    }
    
   
}
