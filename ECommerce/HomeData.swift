//
//  HomeData.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on July 27, 2019

import Foundation


class HomeData : NSObject, NSCoding{
    
    var bestSeller : [ProductItem]!
    var hotDeals : [AnyObject]!
    public var newArrival : [ProductItem]!
    var sideMenuCategories : [SideMenuCategory]!
    var topCategories : [TopCategory]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        bestSeller = [ProductItem]()
        if let bestSellerArray = dictionary["best_seller"] as? [[String:Any]]{
            for dic in bestSellerArray{
                let value = ProductItem(fromDictionary: dic)
                bestSeller.append(value)
            }
        }
        newArrival = [ProductItem]()
        if let newArrivalArray = dictionary["new_arrival"] as? [[String:Any]]{
            for dic in newArrivalArray{
                let value = ProductItem(fromDictionary: dic)
                newArrival.append(value)
            }
        }
        sideMenuCategories = [SideMenuCategory]()
        if let sideMenuCategoriesArray = dictionary["side_menu_categories"] as? [[String:Any]]{
            for dic in sideMenuCategoriesArray{
                let value = SideMenuCategory(fromDictionary: dic)
                sideMenuCategories.append(value)
            }
        }
        topCategories = [TopCategory]()
        if let topCategoriesArray = dictionary["top_categories"] as? [[String:Any]]{
            for dic in topCategoriesArray{
                let value = TopCategory(fromDictionary: dic)
                topCategories.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if bestSeller != nil{
            var dictionaryElements = [[String:Any]]()
            for bestSellerElement in bestSeller {
                dictionaryElements.append(bestSellerElement.toDictionary())
            }
            dictionary["bestSeller"] = dictionaryElements
        }
        if newArrival != nil{
            var dictionaryElements = [[String:Any]]()
            for newArrivalElement in newArrival {
                dictionaryElements.append(newArrivalElement.toDictionary())
            }
            dictionary["newArrival"] = dictionaryElements
        }
        if sideMenuCategories != nil{
            var dictionaryElements = [[String:Any]]()
            for sideMenuCategoriesElement in sideMenuCategories {
                dictionaryElements.append(sideMenuCategoriesElement.toDictionary())
            }
            dictionary["sideMenuCategories"] = dictionaryElements
        }
        if topCategories != nil{
            var dictionaryElements = [[String:Any]]()
            for topCategoriesElement in topCategories {
                dictionaryElements.append(topCategoriesElement.toDictionary())
            }
            dictionary["topCategories"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        bestSeller = aDecoder.decodeObject(forKey: "best_seller") as? [ProductItem]
        hotDeals = aDecoder.decodeObject(forKey: "hot_deals") as? [AnyObject]
        newArrival = aDecoder.decodeObject(forKey: "new_arrival") as? [ProductItem]
        sideMenuCategories = aDecoder.decodeObject(forKey: "side_menu_categories") as? [SideMenuCategory]
        topCategories = aDecoder.decodeObject(forKey: "top_categories") as? [TopCategory]
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if bestSeller != nil{
            aCoder.encode(bestSeller, forKey: "best_seller")
        }
        if hotDeals != nil{
            aCoder.encode(hotDeals, forKey: "hot_deals")
        }
        if newArrival != nil{
            aCoder.encode(newArrival, forKey: "new_arrival")
        }
        if sideMenuCategories != nil{
            aCoder.encode(sideMenuCategories, forKey: "side_menu_categories")
        }
        if topCategories != nil{
            aCoder.encode(topCategories, forKey: "top_categories")
        }
    }
}
