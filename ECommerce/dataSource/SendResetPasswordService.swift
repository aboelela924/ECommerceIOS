//
//  SendResetPasswordService.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/26/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol SendResetPasswordPresenterDelegate: BasicPresenterDelegate{
    func onResetResponse(message: String, code: Int)
}

class SendResetPasswordService{
    
    var delegate: SendResetPasswordPresenterDelegate!
    
    init(presenter: SendResetPasswordPresenterDelegate) {
        self.delegate = presenter
    }
    
    func sendResetRequest(phoneNumber: String){
        let url = "\(Networking.BASE_URL)api/v1/user/auth/send-reset-password-code"
        let body: [String:String] = ["phone": phoneNumber]
        Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: Networking.basicHeaders)
            .responseJSON { (response) in
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
                        let message = json["message"].stringValue
                        let code = json["code"].intValue
                        print(code)
                        self.delegate.onResetResponse(message: message, code: code)
                    }
                    
                }catch let error{
                    print(error)
                }
        }
    }
    
}
