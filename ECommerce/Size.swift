//
//  Size.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on August 8, 2019

import Foundation


class Size : NSObject, NSCoding{
    
    var createdAt : String!
    var id : Int!
    var price : Int!
    var productId : Int!
    var size : String!
    var updatedAt : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        createdAt = dictionary["created_at"] as? String
        id = dictionary["id"] as? Int
        price = dictionary["price"] as? Int
        productId = dictionary["product_id"] as? Int
        size = dictionary["size"] as? String
        updatedAt = dictionary["updated_at"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if price != nil{
            dictionary["price"] = price
        }
        if productId != nil{
            dictionary["product_id"] = productId
        }
        if size != nil{
            dictionary["size"] = size
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        price = aDecoder.decodeObject(forKey: "price") as? Int
        productId = aDecoder.decodeObject(forKey: "product_id") as? Int
        size = aDecoder.decodeObject(forKey: "size") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if productId != nil{
            aCoder.encode(productId, forKey: "product_id")
        }
        if size != nil{
            aCoder.encode(size, forKey: "size")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
    }
}
