//
//  GetHomeDataService.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/27/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol GethomeDataPresenterDelegate: BasicPresenterDelegate {
    func onSuccess(date: HomeData)
    func imageAddedToFavourite(productId: Int)
}

class GetHomeDataService{
    var delegate: GethomeDataPresenterDelegate!
    
    init(delegate: GethomeDataPresenterDelegate) {
        self.delegate = delegate
    }
    
    func getData(){
        let url = "\(Networking.BASE_URL)api/v1/user/app/home"
        Alamofire.request(url, method: .get
            , parameters: nil, encoding: JSONEncoding.default, headers: Networking.basicHeaders).responseJSON { (response) in
                do{
                    let json =  try JSON(data: response.data!)
                    if(response.response?.statusCode == 422){
                        let jsonErrors = json.dictionaryObject!
                        let masterError = MasterError(fromDictionary: jsonErrors)
                        self.delegate?.onFailure(message: masterError.errors[0].message)
                    }else{
                        let dataDic = json.dictionaryObject!
                        let homeData = HomeData(fromDictionary: dataDic)
                        self.delegate!.onSuccess(date: homeData)
                    }
                }catch let error{
                    print(error)
                }
        }
    }
    
    func getData(apiToken: String){
        let url = "\(Networking.BASE_URL)api/v1/user/app/home"
        let params = ["api_token": apiToken]
        Alamofire.request(url, method: .get
            , parameters: params, encoding: JSONEncoding.default, headers: Networking.basicHeaders).responseJSON { (response) in
                do{
                    let json =  try JSON(data: response.data!)
                    if(response.response?.statusCode == 422){
                        let jsonErrors = json.dictionaryObject!
                        let masterError = MasterError(fromDictionary: jsonErrors)
                        self.delegate?.onFailure(message: masterError.errors[0].message)
                    }else{
                        let dataDic = json.dictionaryObject!
                        let homeData = HomeData(fromDictionary: dataDic)
                        self.delegate!.onSuccess(date: homeData)
                    }
                }catch let error{
                    print(error)
                }
        }
    }
    
    func likeImage(apiToken: String, productId: Int){
        let url = "\(Networking.BASE_URL)api/v1/user/app/action/favourite"
        let body: [String: Any] = ["api_token": apiToken, "product_id": productId]
        Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: Networking.basicHeaders)
            .responseJSON { (response) in
                do{
                    let json =  try JSON(data: response.data!)
                    if(response.response?.statusCode == 422){
                        let jsonErrors = json.dictionaryObject!
                        let masterError = MasterError(fromDictionary: jsonErrors)
                        self.delegate?.onFailure(message: masterError.errors[0].message)
                    }else{
                        self.delegate.imageAddedToFavourite(productId: productId)
                    }
                }catch let error{
                    print(error)
                }
                
        }
    }
    
}
