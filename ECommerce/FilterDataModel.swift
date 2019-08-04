//
//  FilterDataModel.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on August 3, 2019

import Foundation


class FilterDataModel : NSObject, NSCoding{
    
    var brands : [Brand]!
    var maxPrice : Int!
    var minPrice : Int!
    var subCategories : [Subcategory]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        maxPrice = dictionary["max_price"] as? Int
        minPrice = dictionary["min_price"] as? Int
        brands = [Brand]()
        if let brandsArray = dictionary["brands"] as? [[String:Any]]{
            for dic in brandsArray{
                let value = Brand(fromDictionary: dic)
                brands.append(value)
            }
        }
        subCategories = [Subcategory]()
        if let subCategoriesArray = dictionary["subCategories"] as? [[String:Any]]{
            for dic in subCategoriesArray{
                let value = Subcategory(fromDictionary: dic)
                subCategories.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if maxPrice != nil{
            dictionary["max_price"] = maxPrice
        }
        if minPrice != nil{
            dictionary["min_price"] = minPrice
        }
        if brands != nil{
            var dictionaryElements = [[String:Any]]()
            for brandsElement in brands {
                dictionaryElements.append(brandsElement.toDictionary())
            }
            dictionary["brands"] = dictionaryElements
        }
        if subCategories != nil{
            var dictionaryElements = [[String:Any]]()
            for subCategoriesElement in subCategories {
                dictionaryElements.append(subCategoriesElement.toDictionary())
            }
            dictionary["subCategories"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        brands = aDecoder.decodeObject(forKey: "brands") as? [Brand]
        maxPrice = aDecoder.decodeObject(forKey: "max_price") as? Int
        minPrice = aDecoder.decodeObject(forKey: "min_price") as? Int
        subCategories = aDecoder.decodeObject(forKey: "subCategories") as? [Subcategory]
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if brands != nil{
            aCoder.encode(brands, forKey: "brands")
        }
        if maxPrice != nil{
            aCoder.encode(maxPrice, forKey: "max_price")
        }
        if minPrice != nil{
            aCoder.encode(minPrice, forKey: "min_price")
        }
        if subCategories != nil{
            aCoder.encode(subCategories, forKey: "subCategories")
        }
    }
}
