//
//  Cart.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on August 14, 2019

import Foundation


class Cart : NSObject, NSCoding{
    
    var createdAt : String!
    var id : Int!
    var product : Product!
    var productId : Int!
    var quantity : Int!
    var updatedAt : String!
    var userId : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        createdAt = dictionary["created_at"] as? String
        id = dictionary["id"] as? Int
        productId = dictionary["product_id"] as? Int
        quantity = dictionary["quantity"] as? Int
        updatedAt = dictionary["updated_at"] as? String
        userId = dictionary["user_id"] as? Int
        if let productData = dictionary["product"] as? [String:Any]{
            product = Product(fromDictionary: productData)
        }
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
        if productId != nil{
            dictionary["product_id"] = productId
        }
        if quantity != nil{
            dictionary["quantity"] = quantity
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        if product != nil{
            dictionary["product"] = product.toDictionary()
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
        product = aDecoder.decodeObject(forKey: "product") as? Product
        productId = aDecoder.decodeObject(forKey: "product_id") as? Int
        quantity = aDecoder.decodeObject(forKey: "quantity") as? Int
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        userId = aDecoder.decodeObject(forKey: "user_id") as? Int
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
        if product != nil{
            aCoder.encode(product, forKey: "product")
        }
        if productId != nil{
            aCoder.encode(productId, forKey: "product_id")
        }
        if quantity != nil{
            aCoder.encode(quantity, forKey: "quantity")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
    }
}
