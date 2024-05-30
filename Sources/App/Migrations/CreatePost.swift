//
//  CreatePost.swift
//
//
//  Created by Developer IOS on 29/05/2024.
//


import Vapor
import Fluent

struct CreatePost: AsyncMigration {
    
    func prepare(on database: any FluentKit.Database) async throws {
        
        try await database.schema("post")
            .id()
            .field("title",.string,.required)
            .field("info",.string,.required)
            .field("date",.string,.required)
            .field("img",.string)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("post").delete()
    }
}
