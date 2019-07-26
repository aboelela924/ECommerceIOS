//
//  SigninService.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/25/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol SigninPresenterDelegate: BasicPresenterDelegate{
    func onSigninSuccess(user: User)
}


class SigninService{
    var delegate: SigninPresenterDelegate!
    
    init(delegate: SigninPresenterDelegate) {
        self.delegate = delegate
    }
    
    func signin(emailOrPhone: String, password: String){
        let body: [String: String] = ["name": emailOrPhone, "password": password, "mobile_token": "121212121", "os": "ios"]
        let url = "\(Networking.BASE_URL)api/v1/user/auth/signin"
        Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: Networking.basicHeaders).responseJSON { (response) in
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
                    self.delegate?.onSigninSuccess(user: masterUser.user!)
                }
                
            }catch let error{
                print(error)
            }
        }
    }
}
