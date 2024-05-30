//
//  CreateService.swift
//
//
//  Created by Developer IOS on 29/05/2024.
//

import Vapor
import Fluent

struct CreateService: AsyncMigration {
    func prepare(on database: any FluentKit.Database) async throws {
        
        try await database.schema("service")
        
            .id()
            .field("name",.string,.required)
            .field("info",.string,.required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("service").delete()
    }
}
