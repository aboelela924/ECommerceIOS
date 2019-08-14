//
//  CartMaster.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on August 14, 2019

import Foundation


class CartMaster : NSObject, NSCoding{
    
    var carts : [Cart]!
    var shipping : String!
    var totalItems : Int!
    var totalPrice : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        shipping = dictionary["shipping"] as? String
        totalItems = dictionary["total_items"] as? Int
        totalPrice = dictionary["total_price"] as? Int
        carts = [Cart]()
        if let cartsArray = dictionary["carts"] as? [[String:Any]]{
            for dic in cartsArray{
                let value = Cart(fromDictionary: dic)
                carts.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if shipping != nil{
            dictionary["shipping"] = shipping
        }
        if totalItems != nil{
            dictionary["total_items"] = totalItems
        }
        if totalPrice != nil{
            dictionary["total_price"] = totalPrice
        }
        if carts != nil{
            var dictionaryElements = [[String:Any]]()
            for cartsElement in carts {
                dictionaryElements.append(cartsElement.toDictionary())
            }
            dictionary["carts"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        carts = aDecoder.decodeObject(forKey: "carts") as? [Cart]
        shipping = aDecoder.decodeObject(forKey: "shipping") as? String
        totalItems = aDecoder.decodeObject(forKey: "total_items") as? Int
        totalPrice = aDecoder.decodeObject(forKey: "total_price") as? Int
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if carts != nil{
            aCoder.encode(carts, forKey: "carts")
        }
        if shipping != nil{
            aCoder.encode(shipping, forKey: "shipping")
        }
        if totalItems != nil{
            aCoder.encode(totalItems, forKey: "total_items")
        }
        if totalPrice != nil{
            aCoder.encode(totalPrice, forKey: "total_price")
        }
    }
}
