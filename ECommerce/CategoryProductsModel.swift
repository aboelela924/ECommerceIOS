//
//  CategoryProductsModel.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on August 1, 2019

import Foundation


class CategoryProductsModel : NSObject, NSCoding{
    
    var products : Product!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        if let productsData = dictionary["products"] as? [String:Any]{
            products = Product(fromDictionary: productsData)
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if products != nil{
            dictionary["products"] = products.toDictionary()
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        products = aDecoder.decodeObject(forKey: "products") as? Product
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if products != nil{
            aCoder.encode(products, forKey: "products")
        }
    }
}
