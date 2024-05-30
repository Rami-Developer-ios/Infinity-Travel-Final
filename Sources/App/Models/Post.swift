//
//  Post.swift
//
//
//  Created by Developer IOS on 29/05/2024.
//

import Vapor
import Fluent

final class Post:Model,@unchecked Sendable {
    
    
    static let schema =  "post"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "info")
    var info: String
    
    @Field(key: "date")
    var date: String
    
    @Field(key: "img")
    var img: String?
    
    init() {
        
    }
    init(id: UUID? = nil, title: String, info: String, date: String, img: String? = nil) {
        self.id = id
        self.title = title
        self.info = info
        self.date = date
        self.img = img
    }
    
}

extension Post: Content{ }

