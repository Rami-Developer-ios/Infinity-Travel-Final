//
//  TravelDestinationController.swift
//
//
//  Created by Developer IOS on 29/05/2024.
//

import Vapor

struct TravelDestinationController: RouteCollection {
    
    func boot(routes: any Vapor.RoutesBuilder) throws {
        
        let route = routes.grouped("destination")
        
        route.get(use: {try await index(req:$0)})
        
        route.post(use: {try await create(req: $0)})
        
        route.put("update",":id", use: {try await update(req: $0)})
        
    }
    
    func index(req:Request) async throws -> [TravelDestination]{
        try await req.db.query(TravelDestination.self).all()
    }
    
    func create(req:Request) async throws -> TravelDestination{
        
        let data = try req.content.decode(TravelDestination.self)

        try await data.save(on: req.db)
        return data
    }
    func update(req:Request) async throws -> TravelDestination{
        
        guard let DestinationID = try await TravelDestination.find(req.parameters.get("id"), on: req.db) else{
            throw Abort(.notFound)
        }
        let updateData = try req.content.decode(TravelDestination.self)
        
        DestinationID.name = updateData.name
        DestinationID.locationInfo = updateData.locationInfo
        DestinationID.price = updateData.price
        DestinationID.img = updateData.img
        
        try await DestinationID.save(on: req.db)
        
        return DestinationID
    }
    
}

