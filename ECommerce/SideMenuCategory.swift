//
//  SideMenuCategory.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on July 27, 2019

import Foundation


class SideMenuCategory : NSObject, NSCoding{
    
    var createdAt : String!
    var id : Int!
    var image : String!
    var nameAr : String!
    var nameEn : String!
    var numberOfProducts : Int!
    var special : Int!
    var status : Int!
    var updatedAt : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        createdAt = dictionary["created_at"] as? String
        id = dictionary["id"] as? Int
        image = dictionary["image"] as? String
        nameAr = dictionary["name_ar"] as? String
        nameEn = dictionary["name_en"] as? String
        numberOfProducts = dictionary["number_of_products"] as? Int
        special = dictionary["special"] as? Int
        status = dictionary["status"] as? Int
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
        if nameAr != nil{
            dictionary["name_ar"] = nameAr
        }
        if nameEn != nil{
            dictionary["name_en"] = nameEn
        }
        if numberOfProducts != nil{
            dictionary["number_of_products"] = numberOfProducts
        }
        if special != nil{
            dictionary["special"] = special
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
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? String
        nameAr = aDecoder.decodeObject(forKey: "name_ar") as? String
        nameEn = aDecoder.decodeObject(forKey: "name_en") as? String
        numberOfProducts = aDecoder.decodeObject(forKey: "number_of_products") as? Int
        special = aDecoder.decodeObject(forKey: "special") as? Int
        status = aDecoder.decodeObject(forKey: "status") as? Int
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
        if nameAr != nil{
            aCoder.encode(nameAr, forKey: "name_ar")
        }
        if nameEn != nil{
            aCoder.encode(nameEn, forKey: "name_en")
        }
        if numberOfProducts != nil{
            aCoder.encode(numberOfProducts, forKey: "number_of_products")
        }
        if special != nil{
            aCoder.encode(special, forKey: "special")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
    }
}
