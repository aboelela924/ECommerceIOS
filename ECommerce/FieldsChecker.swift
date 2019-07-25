//
//  FieldsChecker.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/24/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation

class FieldsChecker{
    class func isValidName(name: String) -> Bool {
        let RegEx = ".*[^A-Za-z ].*"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: name)
    }
    
    class func isValidEmail(email: String) -> Bool{
        let RegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: email)
    }
    
    class func isValidePhoneNumber(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{11}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    class func arePasswordMatches(pass: String, confirmPass: String) -> Bool{
        return pass == confirmPass
    }
}
