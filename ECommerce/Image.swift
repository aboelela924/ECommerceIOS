//
//  Image.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on July 27, 2019

import Foundation


class Image : NSObject, NSCoding{
    
    var createdAt : String!
    var id : Int!
    var image : String!
    var productId : Int!
    var updatedAt : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        createdAt = dictionary["created_at"] as? String
        id = dictionary["id"] as? Int
        image = dictionary["image"] as? String
        productId = dictionary["product_id"] as? Int
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
        if image != nil{
            dictionary["image"] = image
        }
        if productId != nil{
            dictionary["product_id"] = productId
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
        image = aDecoder.decodeObject(forKey: "image") as? String
        productId = aDecoder.decodeObject(forKey: "product_id") as? Int
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
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if productId != nil{
            aCoder.encode(productId, forKey: "product_id")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
    }
}
