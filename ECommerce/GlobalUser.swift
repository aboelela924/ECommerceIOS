//
//  GlobalUser.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 8/11/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation

class GlobalUser{
    var user: User!
    static var globalUser: GlobalUser!
    
    class func getInstance() -> GlobalUser{
        if(globalUser == nil){
            globalUser = GlobalUser()
        }
        return globalUser
    }
    
    private init(){
        
    }
}
