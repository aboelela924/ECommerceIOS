//
//  Error.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on July 25, 2019

import Foundation

class MasterError : NSObject, NSCoding{
    
    var errors : [Error]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        errors = [Error]()
        if let errorsArray = dictionary["errors"] as? [[String:Any]]{
            for dic in errorsArray{
                let value = Error(fromDictionary: dic)
                errors.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if errors != nil{
            var dictionaryElements = [[String:Any]]()
            for errorsElement in errors {
                dictionaryElements.append(errorsElement.toDictionary())
            }
            dictionary["errors"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        errors = aDecoder.decodeObject(forKey: "errors") as? [Error]
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if errors != nil{
            aCoder.encode(errors, forKey: "errors")
        }
    }
}


class Error : NSObject, NSCoding{
    
    var code : Int!
    var message : String!
    var name : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        code = dictionary["code"] as? Int
        message = dictionary["message"] as? String
        name = dictionary["name"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if code != nil{
            dictionary["code"] = code
        }
        if message != nil{
            dictionary["message"] = message
        }
        if name != nil{
            dictionary["name"] = name
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        code = aDecoder.decodeObject(forKey: "code") as? Int
        message = aDecoder.decodeObject(forKey: "message") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
    }
}
