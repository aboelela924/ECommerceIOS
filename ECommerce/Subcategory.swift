//
//  Subcategory.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on July 27, 2019

import Foundation


class Subcategory : NSObject, NSCoding{
    
    var categoryId : Int!
    var createdAt : String!
    var id : Int!
    var nameAr : String!
    var nameEn : String!
    var status : Int!
    var updatedAt : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        categoryId = dictionary["category_id"] as? Int
        createdAt = dictionary["created_at"] as? String
        id = dictionary["id"] as? Int
        nameAr = dictionary["name_ar"] as? String
        nameEn = dictionary["name_en"] as? String
        status = dictionary["status"] as? Int
        updatedAt = dictionary["updated_at"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if categoryId != nil{
            dictionary["category_id"] = categoryId
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if nameAr != nil{
            dictionary["name_ar"] = nameAr
        }
        if nameEn != nil{
            dictionary["name_en"] = nameEn
        }
        if status != nil{
            dictionary["status"] = status
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
        categoryId = aDecoder.decodeObject(forKey: "category_id") as? Int
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        nameAr = aDecoder.decodeObject(forKey: "name_ar") as? String
        nameEn = aDecoder.decodeObject(forKey: "name_en") as? String
        status = aDecoder.decodeObject(forKey: "status") as? Int
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if categoryId != nil{
            aCoder.encode(categoryId, forKey: "category_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if nameAr != nil{
            aCoder.encode(nameAr, forKey: "name_ar")
        }
        if nameEn != nil{
            aCoder.encode(nameEn, forKey: "name_en")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
    }
}
