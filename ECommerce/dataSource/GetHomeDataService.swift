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
                    let dataDic = json.dictionaryObject!
                    let homeData = HomeData(fromDictionary: dataDic)
                    self.delegate!.onSuccess(date: homeData)
                }catch let error{
                    print(error)
                }
        }
    }
}
