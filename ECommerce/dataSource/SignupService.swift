//
//  SignupService.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/24/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class SignupService{
    var delegate: SignupPresenterDelegate?
    
    init(delegate: SignupPresenterDelegate) {
        self.delegate = delegate
    }
    
    func signup(name: String, email: String, phoneNumber: String, password: String){
        let body: [String: String] = ["name": name, "email": email, "phone": phoneNumber, "password": password]
        let url = "\(Networking.BASE_URL)api/v1/user/auth/signup"
        Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: Networking.basicHeaders).responseJSON { (response) in
            print(response.response?.statusCode)
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
                    self.delegate?.onSignupSuccess(user: masterUser.user!)
                }
                
            }catch let error{
                print(error)
            }
            
        }
    }



}
