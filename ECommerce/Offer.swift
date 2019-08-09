//
//  Offer.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on August 8, 2019

import Foundation


class Offer : NSObject, NSCoding{
    
    var createdAt : String!
    var endDate : String!
    var id : Int!
    var percentage : Int!
    var price : Float!
    var product : ProductItem!
    var productId : Int!
    var startDate : String!
    var updatedAt : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        createdAt = dictionary["created_at"] as? String
        endDate = dictionary["end_date"] as? String
        id = dictionary["id"] as? Int
        percentage = dictionary["percentage"] as? Int
        price = dictionary["price"] as? Float
        productId = dictionary["product_id"] as? Int
        startDate = dictionary["start_date"] as? String
        updatedAt = dictionary["updated_at"] as? String
        if let productData = dictionary["product"] as? [String:Any]{
            product = ProductItem(fromDictionary: productData)
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
        if endDate != nil{
            dictionary["end_date"] = endDate
        }
        if id != nil{
            dictionary["id"] = id
        }
        if percentage != nil{
            dictionary["percentage"] = percentage
        }
        if price != nil{
            dictionary["price"] = price
        }
        if productId != nil{
            dictionary["product_id"] = productId
        }
        if startDate != nil{
            dictionary["start_date"] = startDate
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
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
        endDate = aDecoder.decodeObject(forKey: "end_date") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        percentage = aDecoder.decodeObject(forKey: "percentage") as? Int
        price = aDecoder.decodeObject(forKey: "price") as? Float
        product = aDecoder.decodeObject(forKey: "product") as? ProductItem
        productId = aDecoder.decodeObject(forKey: "product_id") as? Int
        startDate = aDecoder.decodeObject(forKey: "start_date") as? String
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
        if endDate != nil{
            aCoder.encode(endDate, forKey: "end_date")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if percentage != nil{
            aCoder.encode(percentage, forKey: "percentage")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if product != nil{
            aCoder.encode(product, forKey: "product")
        }
        if productId != nil{
            aCoder.encode(productId, forKey: "product_id")
        }
        if startDate != nil{
            aCoder.encode(startDate, forKey: "start_date")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
    }
}
