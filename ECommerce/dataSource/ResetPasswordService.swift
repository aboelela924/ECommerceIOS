//
//  ResetPasswordService.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/26/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ResetPasswordPresenterDelegate: BasicPresenterDelegate {
    func onSuccess(message: String, user: User)
}

class ResetPasswordService{
    
    var delegate: ResetPasswordPresenterDelegate!
    
    init(delegate: ResetPasswordPresenterDelegate) {
        self.delegate = delegate
    }
    
    func updatePassword(phoneNumber: String, resetCode: String, password: String){
        let url = "\(Networking.BASE_URL)api/v1/user/auth/reset-password"
        let params: [String: String] = ["phone":phoneNumber, "reset_password_code":resetCode, "password":password]
        
        Alamofire.request(url, method: .patch, parameters: params, encoding: JSONEncoding.default, headers: Networking.basicHeaders).responseJSON { (response) in
            if(response.error != nil){
                self.delegate?.onFailure(message: "Something goes wrong. Please try again.")
                return
            }
            
            
            do{
                let json = try JSON(data: response.data!)
                print(json)
                if(response.response?.statusCode == 422){
                    let jsonErrors = json.dictionaryObject! as! [String: Any]
                    let masterError = MasterError(fromDictionary: jsonErrors)
                    self.delegate?.onFailure(message: masterError.errors[0].message)
                }else{
                    let jsonDic = json.dictionaryObject! as! [String: Any]
                    let masterUser = MasterUser(fromDictionary: jsonDic)
                    self.delegate.onSuccess(message: "Password reset successfully.", user: masterUser.user!)
                }
                
            }catch let error{
                print(error)
            }
        }
    }
}
