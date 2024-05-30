//
//  TravelDestination.swift
//
//
//  Created by Developer IOS on 29/05/2024.
//


import Vapor
import Fluent

final class TravelDestination:Model,@unchecked Sendable {
    
    
    static let schema =  "destination"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "locationInfo")
    var locationInfo: String
    
    @Field(key: "price")
    var price: String
    
    @Field(key: "img")
    var img: String?
    
    init() {
        
    }
    init(id: UUID? = nil, name: String, locationInfo: String, price: String, img: String? = nil) {
        self.id = id
        self.name = name
        self.locationInfo = locationInfo
        self.price = price
        self.img = img
    }
    
}

extension TravelDestination: Content{ }
