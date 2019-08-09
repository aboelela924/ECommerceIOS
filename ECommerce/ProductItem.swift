//
//  BestSeller.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on July 27, 2019

import Foundation


class ProductItem : NSObject, NSCoding{
    
    var brand : Brand!
    var brandId : Int!
    var colors : [Color]!
    var comments : [AnyObject]!
    var countPaid : Int!
    var createdAt : String!
    var defaultImage : String!
    var descriptionAr : String!
    var descriptionEn : String!
    var disable : Int!
    var friendlyUrl : String!
    var id : Int!
    var images : [Image]!
    var isFav : Bool!
    var isReviewed : Bool!
    var longDescriptionAr : String!
    var longDescriptionEn : String!
    var nameAr : String!
    var nameEn : String!
    var offer : [Offer]!
    var price : Int!
    var reviews : [AnyObject]!
    var shippingSpecification : String!
    var sizes : [Size]!
    var slider : [AnyObject]!
    var status : Int!
    var stock : Int!
    var subCategoryId : Int!
    var subcategory : Subcategory!
    var todayOffer : AnyObject!
    var totalRate : Int!
    var updatedAt : String!
    var url : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        brandId = dictionary["brand_id"] as? Int
        countPaid = dictionary["count_paid"] as? Int
        createdAt = dictionary["created_at"] as? String
        defaultImage = dictionary["default_image"] as? String
        descriptionAr = dictionary["description_ar"] as? String
        descriptionEn = dictionary["description_en"] as? String
        disable = dictionary["disable"] as? Int
        friendlyUrl = dictionary["friendly_url"] as? String
        id = dictionary["id"] as? Int
        isFav = dictionary["is_fav"] as? Bool
        isReviewed = dictionary["is_reviewed"] as? Bool
        longDescriptionAr = dictionary["long_description_ar"] as? String
        longDescriptionEn = dictionary["long_description_en"] as? String
        nameAr = dictionary["name_ar"] as? String
        nameEn = dictionary["name_en"] as? String
        price = dictionary["price"] as? Int
        shippingSpecification = dictionary["shipping_specification"] as? String
        status = dictionary["status"] as? Int
        stock = dictionary["stock"] as? Int
        subCategoryId = dictionary["sub_category_id"] as? Int
        todayOffer = dictionary["today_offer"] as? AnyObject
        totalRate = dictionary["total_rate"] as? Int
        updatedAt = dictionary["updated_at"] as? String
        url = dictionary["url"] as? String
        if let brandData = dictionary["brand"] as? [String:Any]{
            brand = Brand(fromDictionary: brandData)
        }
        if let subcategoryData = dictionary["subcategory"] as? [String:Any]{
            subcategory = Subcategory(fromDictionary: subcategoryData)
        }
        colors = [Color]()
        if let colorsArray = dictionary["colors"] as? [[String:Any]]{
            for dic in colorsArray{
                let value = Color(fromDictionary: dic)
                colors.append(value)
            }
        }
        images = [Image]()
        if let imagesArray = dictionary["images"] as? [[String:Any]]{
            for dic in imagesArray{
                let value = Image(fromDictionary: dic)
                images.append(value)
            }
        }
        offer = [Offer]()
        if let offerArray = dictionary["offer"] as? [[String:Any]]{
            for dic in offerArray{
                let value = Offer(fromDictionary: dic)
                offer.append(value)
            }
        }
        sizes = [Size]()
        if let sizesArray = dictionary["sizes"] as? [[String:Any]]{
            for dic in sizesArray{
                let value = Size(fromDictionary: dic)
                sizes.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if brandId != nil{
            dictionary["brand_id"] = brandId
        }
        if countPaid != nil{
            dictionary["count_paid"] = countPaid
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if defaultImage != nil{
            dictionary["default_image"] = defaultImage
        }
        if descriptionAr != nil{
            dictionary["description_ar"] = descriptionAr
        }
        if descriptionEn != nil{
            dictionary["description_en"] = descriptionEn
        }
        if disable != nil{
            dictionary["disable"] = disable
        }
        if friendlyUrl != nil{
            dictionary["friendly_url"] = friendlyUrl
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isFav != nil{
            dictionary["is_fav"] = isFav
        }
        if isReviewed != nil{
            dictionary["is_reviewed"] = isReviewed
        }
        if longDescriptionAr != nil{
            dictionary["long_description_ar"] = longDescriptionAr
        }
        if longDescriptionEn != nil{
            dictionary["long_description_en"] = longDescriptionEn
        }
        if nameAr != nil{
            dictionary["name_ar"] = nameAr
        }
        if nameEn != nil{
            dictionary["name_en"] = nameEn
        }
        if price != nil{
            dictionary["price"] = price
        }
        if shippingSpecification != nil{
            dictionary["shipping_specification"] = shippingSpecification
        }
        if status != nil{
            dictionary["status"] = status
        }
        if stock != nil{
            dictionary["stock"] = stock
        }
        if subCategoryId != nil{
            dictionary["sub_category_id"] = subCategoryId
        }
        if todayOffer != nil{
            dictionary["today_offer"] = todayOffer
        }
        if totalRate != nil{
            dictionary["total_rate"] = totalRate
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if url != nil{
            dictionary["url"] = url
        }
        if brand != nil{
            dictionary["brand"] = brand.toDictionary()
        }
        if subcategory != nil{
            dictionary["subcategory"] = subcategory.toDictionary()
        }
        if colors != nil{
            var dictionaryElements = [[String:Any]]()
            for colorsElement in colors {
                dictionaryElements.append(colorsElement.toDictionary())
            }
            dictionary["colors"] = dictionaryElements
        }
        if images != nil{
            var dictionaryElements = [[String:Any]]()
            for imagesElement in images {
                dictionaryElements.append(imagesElement.toDictionary())
            }
            dictionary["images"] = dictionaryElements
        }
        if offer != nil{
            var dictionaryElements = [[String:Any]]()
            for offerElement in offer {
                dictionaryElements.append(offerElement.toDictionary())
            }
            dictionary["offer"] = dictionaryElements
        }
        if sizes != nil{
            var dictionaryElements = [[String:Any]]()
            for sizesElement in sizes {
                dictionaryElements.append(sizesElement.toDictionary())
            }
            dictionary["sizes"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        brand = aDecoder.decodeObject(forKey: "brand") as? Brand
        brandId = aDecoder.decodeObject(forKey: "brand_id") as? Int
        colors = aDecoder.decodeObject(forKey: "colors") as? [Color]
        comments = aDecoder.decodeObject(forKey: "comments") as? [AnyObject]
        countPaid = aDecoder.decodeObject(forKey: "count_paid") as? Int
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        defaultImage = aDecoder.decodeObject(forKey: "default_image") as? String
        descriptionAr = aDecoder.decodeObject(forKey: "description_ar") as? String
        descriptionEn = aDecoder.decodeObject(forKey: "description_en") as? String
        disable = aDecoder.decodeObject(forKey: "disable") as? Int
        friendlyUrl = aDecoder.decodeObject(forKey: "friendly_url") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        images = aDecoder.decodeObject(forKey: "images") as? [Image]
        isFav = aDecoder.decodeObject(forKey: "is_fav") as? Bool
        isReviewed = aDecoder.decodeObject(forKey: "is_reviewed") as? Bool
        longDescriptionAr = aDecoder.decodeObject(forKey: "long_description_ar") as? String
        longDescriptionEn = aDecoder.decodeObject(forKey: "long_description_en") as? String
        nameAr = aDecoder.decodeObject(forKey: "name_ar") as? String
        nameEn = aDecoder.decodeObject(forKey: "name_en") as? String
        offer = aDecoder.decodeObject(forKey: "offer") as? [Offer]
        price = aDecoder.decodeObject(forKey: "price") as? Int
        reviews = aDecoder.decodeObject(forKey: "reviews") as? [AnyObject]
        shippingSpecification = aDecoder.decodeObject(forKey: "shipping_specification") as? String
        sizes = aDecoder.decodeObject(forKey: "sizes") as? [Size]
        slider = aDecoder.decodeObject(forKey: "slider") as? [AnyObject]
        status = aDecoder.decodeObject(forKey: "status") as? Int
        stock = aDecoder.decodeObject(forKey: "stock") as? Int
        subCategoryId = aDecoder.decodeObject(forKey: "sub_category_id") as? Int
        subcategory = aDecoder.decodeObject(forKey: "subcategory") as? Subcategory
        todayOffer = aDecoder.decodeObject(forKey: "today_offer") as? AnyObject
        totalRate = aDecoder.decodeObject(forKey: "total_rate") as? Int
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if brand != nil{
            aCoder.encode(brand, forKey: "brand")
        }
        if brandId != nil{
            aCoder.encode(brandId, forKey: "brand_id")
        }
        if colors != nil{
            aCoder.encode(colors, forKey: "colors")
        }
        if comments != nil{
            aCoder.encode(comments, forKey: "comments")
        }
        if countPaid != nil{
            aCoder.encode(countPaid, forKey: "count_paid")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if defaultImage != nil{
            aCoder.encode(defaultImage, forKey: "default_image")
        }
        if descriptionAr != nil{
            aCoder.encode(descriptionAr, forKey: "description_ar")
        }
        if descriptionEn != nil{
            aCoder.encode(descriptionEn, forKey: "description_en")
        }
        if disable != nil{
            aCoder.encode(disable, forKey: "disable")
        }
        if friendlyUrl != nil{
            aCoder.encode(friendlyUrl, forKey: "friendly_url")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if images != nil{
            aCoder.encode(images, forKey: "images")
        }
        if isFav != nil{
            aCoder.encode(isFav, forKey: "is_fav")
        }
        if isReviewed != nil{
            aCoder.encode(isReviewed, forKey: "is_reviewed")
        }
        if longDescriptionAr != nil{
            aCoder.encode(longDescriptionAr, forKey: "long_description_ar")
        }
        if longDescriptionEn != nil{
            aCoder.encode(longDescriptionEn, forKey: "long_description_en")
        }
        if nameAr != nil{
            aCoder.encode(nameAr, forKey: "name_ar")
        }
        if nameEn != nil{
            aCoder.encode(nameEn, forKey: "name_en")
        }
        if offer != nil{
            aCoder.encode(offer, forKey: "offer")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if reviews != nil{
            aCoder.encode(reviews, forKey: "reviews")
        }
        if shippingSpecification != nil{
            aCoder.encode(shippingSpecification, forKey: "shipping_specification")
        }
        if sizes != nil{
            aCoder.encode(sizes, forKey: "sizes")
        }
        if slider != nil{
            aCoder.encode(slider, forKey: "slider")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if stock != nil{
            aCoder.encode(stock, forKey: "stock")
        }
        if subCategoryId != nil{
            aCoder.encode(subCategoryId, forKey: "sub_category_id")
        }
        if subcategory != nil{
            aCoder.encode(subcategory, forKey: "subcategory")
        }
        if todayOffer != nil{
            aCoder.encode(todayOffer, forKey: "today_offer")
        }
        if totalRate != nil{
            aCoder.encode(totalRate, forKey: "total_rate")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
    }
}
