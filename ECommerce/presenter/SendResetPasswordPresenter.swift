//
//  ResetPasswordPresenter.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/26/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation


protocol SendResetPasswordViewDelegate: BasicViewDelegate {
    func onResetResponse(message: String, code: Int)
}

class SendResetPasswordPresenter: SendResetPasswordPresenterDelegate{
    
    var view: SendResetPasswordViewDelegate!
    var service: SendResetPasswordService!
    
    init(view: SendResetPasswordViewDelegate) {
        service = SendResetPasswordService(presenter: self)
        self.view = view
    }
    
    func sendResetRequest(phoneNumber: String){
        view.showLoading()
        service.sendResetRequest(phoneNumber: phoneNumber)
    }
    
    func onResetResponse(message: String, code: Int) {
        view.hideLoading()
        view.onResetResponse(message: message, code: code)
    }
    
    func onFailure(message: String) {
        view.showError(message: message)
    }
    
    
}
