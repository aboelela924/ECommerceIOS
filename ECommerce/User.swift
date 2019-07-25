//
//  User.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on July 25, 2019

import Foundation


class User : NSObject, NSCoding{
    
    var activation : Int!
    var addressId : String!
    var apiToken : String!
    var birthDate : String!
    var cartCount : Int!
    var countryId : String!
    var cover : String!
    var createdAt : String!
    var email : String!
    var gender : String!
    var id : Int!
    var image : String!
    var mobileToken : String!
    var name : String!
    var os : String!
    var phone : String!
    var resetPasswordCode : Int!
    var socialId : String!
    var socialType : String!
    var tempPhoneCode : Int!
    var type : Int!
    var updatedAt : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        activation = dictionary["activation"] as? Int
        addressId = dictionary["address_id"] as? String
        apiToken = dictionary["api_token"] as? String
        birthDate = dictionary["birth_date"] as? String
        cartCount = dictionary["cart_count"] as? Int
        countryId = dictionary["country_id"] as? String
        cover = dictionary["cover"] as? String
        createdAt = dictionary["created_at"] as? String
        email = dictionary["email"] as? String
        gender = dictionary["gender"] as? String
        id = dictionary["id"] as? Int
        image = dictionary["image"] as? String
        mobileToken = dictionary["mobile_token"] as? String
        name = dictionary["name"] as? String
        os = dictionary["os"] as? String
        phone = dictionary["phone"] as? String
        resetPasswordCode = dictionary["reset_password_code"] as? Int
        socialId = dictionary["social_id"] as? String
        socialType = dictionary["social_type"] as? String
        tempPhoneCode = dictionary["temp_phone_code"] as? Int
        type = dictionary["type"] as? Int
        updatedAt = dictionary["updated_at"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if activation != nil{
            dictionary["activation"] = activation
        }
        if addressId != nil{
            dictionary["address_id"] = addressId
        }
        if apiToken != nil{
            dictionary["api_token"] = apiToken
        }
        if birthDate != nil{
            dictionary["birth_date"] = birthDate
        }
        if cartCount != nil{
            dictionary["cart_count"] = cartCount
        }
        if countryId != nil{
            dictionary["country_id"] = countryId
        }
        if cover != nil{
            dictionary["cover"] = cover
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if email != nil{
            dictionary["email"] = email
        }
        if gender != nil{
            dictionary["gender"] = gender
        }
        if id != nil{
            dictionary["id"] = id
        }
        if image != nil{
            dictionary["image"] = image
        }
        if mobileToken != nil{
            dictionary["mobile_token"] = mobileToken
        }
        if name != nil{
            dictionary["name"] = name
        }
        if os != nil{
            dictionary["os"] = os
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if resetPasswordCode != nil{
            dictionary["reset_password_code"] = resetPasswordCode
        }
        if socialId != nil{
            dictionary["social_id"] = socialId
        }
        if socialType != nil{
            dictionary["social_type"] = socialType
        }
        if tempPhoneCode != nil{
            dictionary["temp_phone_code"] = tempPhoneCode
        }
        if type != nil{
            dictionary["type"] = type
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
        activation = aDecoder.decodeObject(forKey: "activation") as? Int
        addressId = aDecoder.decodeObject(forKey: "address_id") as? String
        apiToken = aDecoder.decodeObject(forKey: "api_token") as? String
        birthDate = aDecoder.decodeObject(forKey: "birth_date") as? String
        cartCount = aDecoder.decodeObject(forKey: "cart_count") as? Int
        countryId = aDecoder.decodeObject(forKey: "country_id") as? String
        cover = aDecoder.decodeObject(forKey: "cover") as? String
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        gender = aDecoder.decodeObject(forKey: "gender") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? String
        mobileToken = aDecoder.decodeObject(forKey: "mobile_token") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        os = aDecoder.decodeObject(forKey: "os") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        resetPasswordCode = aDecoder.decodeObject(forKey: "reset_password_code") as? Int
        socialId = aDecoder.decodeObject(forKey: "social_id") as? String
        socialType = aDecoder.decodeObject(forKey: "social_type") as? String
        tempPhoneCode = aDecoder.decodeObject(forKey: "temp_phone_code") as? Int
        type = aDecoder.decodeObject(forKey: "type") as? Int
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if activation != nil{
            aCoder.encode(activation, forKey: "activation")
        }
        if addressId != nil{
            aCoder.encode(addressId, forKey: "address_id")
        }
        if apiToken != nil{
            aCoder.encode(apiToken, forKey: "api_token")
        }
        if birthDate != nil{
            aCoder.encode(birthDate, forKey: "birth_date")
        }
        if cartCount != nil{
            aCoder.encode(cartCount, forKey: "cart_count")
        }
        if countryId != nil{
            aCoder.encode(countryId, forKey: "country_id")
        }
        if cover != nil{
            aCoder.encode(cover, forKey: "cover")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if gender != nil{
            aCoder.encode(gender, forKey: "gender")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if mobileToken != nil{
            aCoder.encode(mobileToken, forKey: "mobile_token")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if os != nil{
            aCoder.encode(os, forKey: "os")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if resetPasswordCode != nil{
            aCoder.encode(resetPasswordCode, forKey: "reset_password_code")
        }
        if socialId != nil{
            aCoder.encode(socialId, forKey: "social_id")
        }
        if socialType != nil{
            aCoder.encode(socialType, forKey: "social_type")
        }
        if tempPhoneCode != nil{
            aCoder.encode(tempPhoneCode, forKey: "temp_phone_code")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
    }
}
