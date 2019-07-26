//
//  ResetPasswordPresenter.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/26/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation

protocol ResetPasswordViewDelegate: BasicViewDelegate {
    func onSuccess(message: String, user: User)
}
class ResetPasswordPresenter: ResetPasswordPresenterDelegate{
    
    var service: ResetPasswordService!
    var view: ResetPasswordViewDelegate!

    init(view: ResetPasswordViewDelegate) {
        self.service = ResetPasswordService(delegate: self)
        self.view = view
    }
    
    func updatePassword(phoneNumber: String, resetCode: Int, password: String){
        view.showLoading()
        let resetCodeString: String = String(resetCode)
        service.updatePassword(phoneNumber: phoneNumber, resetCode: resetCodeString, password: password)
    }
    
    func onSuccess(message: String, user: User) {
        view.hideLoading()
        view.onSuccess(message: message, user: user)
    }
    
    func onFailure(message: String) {
        view.hideLoading()
        view.showError(message: message)
    }
    
}
