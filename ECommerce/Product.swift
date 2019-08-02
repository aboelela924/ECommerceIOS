//
//  Product.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on August 1, 2019

import Foundation


class Product : NSObject, NSCoding{
    
    var currentPage : Int!
    var data : [ProductItem]!
    var firstPageUrl : String!
    var from : Int!
    var lastPage : Int!
    var lastPageUrl : String!
    var nextPageUrl : String!
    var path : String!
    var perPage : Int!
    var prevPageUrl : AnyObject!
    var to : Int!
    var total : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        currentPage = dictionary["current_page"] as? Int
        firstPageUrl = dictionary["first_page_url"] as? String
        from = dictionary["from"] as? Int
        lastPage = dictionary["last_page"] as? Int
        lastPageUrl = dictionary["last_page_url"] as? String
        nextPageUrl = dictionary["next_page_url"] as? String
        path = dictionary["path"] as? String
        perPage = dictionary["per_page"] as? Int
        prevPageUrl = dictionary["prev_page_url"] as? AnyObject
        to = dictionary["to"] as? Int
        total = dictionary["total"] as? Int
        data = [ProductItem]()
        if let dataArray = dictionary["data"] as? [[String:Any]]{
            for dic in dataArray{
                let value = ProductItem(fromDictionary: dic)
                data.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if currentPage != nil{
            dictionary["current_page"] = currentPage
        }
        if firstPageUrl != nil{
            dictionary["first_page_url"] = firstPageUrl
        }
        if from != nil{
            dictionary["from"] = from
        }
        if lastPage != nil{
            dictionary["last_page"] = lastPage
        }
        if lastPageUrl != nil{
            dictionary["last_page_url"] = lastPageUrl
        }
        if nextPageUrl != nil{
            dictionary["next_page_url"] = nextPageUrl
        }
        if path != nil{
            dictionary["path"] = path
        }
        if perPage != nil{
            dictionary["per_page"] = perPage
        }
        if prevPageUrl != nil{
            dictionary["prev_page_url"] = prevPageUrl
        }
        if to != nil{
            dictionary["to"] = to
        }
        if total != nil{
            dictionary["total"] = total
        }
        if data != nil{
            var dictionaryElements = [[String:Any]]()
            for dataElement in data {
                dictionaryElements.append(dataElement.toDictionary())
            }
            dictionary["data"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        currentPage = aDecoder.decodeObject(forKey: "current_page") as? Int
        data = aDecoder.decodeObject(forKey: "data") as? [ProductItem]
        firstPageUrl = aDecoder.decodeObject(forKey: "first_page_url") as? String
        from = aDecoder.decodeObject(forKey: "from") as? Int
        lastPage = aDecoder.decodeObject(forKey: "last_page") as? Int
        lastPageUrl = aDecoder.decodeObject(forKey: "last_page_url") as? String
        nextPageUrl = aDecoder.decodeObject(forKey: "next_page_url") as? String
        path = aDecoder.decodeObject(forKey: "path") as? String
        perPage = aDecoder.decodeObject(forKey: "per_page") as? Int
        prevPageUrl = aDecoder.decodeObject(forKey: "prev_page_url") as? AnyObject
        to = aDecoder.decodeObject(forKey: "to") as? Int
        total = aDecoder.decodeObject(forKey: "total") as? Int
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if currentPage != nil{
            aCoder.encode(currentPage, forKey: "current_page")
        }
        if data != nil{
            aCoder.encode(data, forKey: "data")
        }
        if firstPageUrl != nil{
            aCoder.encode(firstPageUrl, forKey: "first_page_url")
        }
        if from != nil{
            aCoder.encode(from, forKey: "from")
        }
        if lastPage != nil{
            aCoder.encode(lastPage, forKey: "last_page")
        }
        if lastPageUrl != nil{
            aCoder.encode(lastPageUrl, forKey: "last_page_url")
        }
        if nextPageUrl != nil{
            aCoder.encode(nextPageUrl, forKey: "next_page_url")
        }
        if path != nil{
            aCoder.encode(path, forKey: "path")
        }
        if perPage != nil{
            aCoder.encode(perPage, forKey: "per_page")
        }
        if prevPageUrl != nil{
            aCoder.encode(prevPageUrl, forKey: "prev_page_url")
        }
        if to != nil{
            aCoder.encode(to, forKey: "to")
        }
        if total != nil{
            aCoder.encode(total, forKey: "total")
        }
    }
}
