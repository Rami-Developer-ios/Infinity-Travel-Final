//
//  ServiceController.swift
//
//
//  Created by Developer IOS on 29/05/2024.
//

import Vapor

struct ServiceController: RouteCollection {
    
    func boot(routes: any Vapor.RoutesBuilder) throws {
        
        let route = routes.grouped("service")
        
        route.get(use: {try await index(req:$0)})
        
        route.post(use: {try await create(req: $0)})
        
        route.put("update",":id", use: {try await update(req: $0)})
        
//        /// Route Add Profile Picture
//        route.get("addProfilePicture",use: {try await addProfilePictureHandler($0)})
//        
//        route.on(.POST,":id","addProfilePicture",body:.collect(maxSize: "10mb"),use: {try await addProfilePicturePostHandler($0)})
    }
    
    func index(req:Request) async throws -> [Service]{
        try await req.db.query(Service.self).all()
    }
    
    func create(req:Request) async throws -> Service{
        
        let data = try req.content.decode(Service.self)

        try await data.save(on: req.db)
        return data
    }
    func update(req:Request) async throws -> Service{
        
        guard let ServicesID = try await Service.find(req.parameters.get("id"), on: req.db) else{
            throw Abort(.notFound)
        }
        let updateData = try req.content.decode(Service.self)
        
        ServicesID.name = updateData.name
        ServicesID.info = updateData.info

        try await ServicesID.save(on: req.db)
        
        return ServicesID
    }
    
}
