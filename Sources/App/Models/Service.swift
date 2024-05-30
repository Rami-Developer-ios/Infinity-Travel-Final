//
//  Service.swift
//
//
//  Created by Developer IOS on 29/05/2024.
//

import Vapor
import Fluent

final class Service:Model,@unchecked Sendable {
  
    
    static let schema =  "service"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "info")
    var info: String
    
    init() {
        
    }
    init(id: UUID? = nil, name: String, info: String) {
        self.id = id
        self.name = name
        self.info = info
    }
    
    

}

extension Service: Content{ }
