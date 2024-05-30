//
//  CreateTravelDestination.swift
//  
//
//  Created by Developer IOS on 29/05/2024.
//

import Vapor
import Fluent

struct CreateTravelDestination: AsyncMigration {
    
    func prepare(on database: any FluentKit.Database) async throws {
        
        try await database.schema("destination")
            .id()
            .field("name",.string,.required)
            .field("locationInfo",.string,.required)
            .field("price",.string,.required)
            .field("img",.string)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("destination").delete()
    }
}
