//
//  PostController.swift
//
//
//  Created by Developer IOS on 29/05/2024.
//

import Vapor

struct PostController: RouteCollection {
    
    func boot(routes: any Vapor.RoutesBuilder) throws {
        
        let route = routes.grouped("post")
        
        
        route.get(use: {try await index(req:$0)})
        
        route.post(use: {try await create(req: $0)})
        
        route.put("update",":id", use: {try await update(req: $0)})
        
    }
    
    func index(req:Request) async throws -> [Post]{
        try await req.db.query(Post.self).all()
    }
    
    func create(req:Request) async throws -> Post{
        
        let data = try req.content.decode(Post.self)

        try await data.save(on: req.db)
        return data
    }
    func update(req:Request) async throws -> Post{
        
        guard let PostID = try await Post.find(req.parameters.get("id"), on: req.db) else{
            throw Abort(.notFound)
        }
        let updateData = try req.content.decode(Post.self)
        
        PostID.title = updateData.title
        PostID.info = updateData.info
        PostID.date = updateData.date
        PostID.img = updateData.img
        
        try await PostID.save(on: req.db)
        
        return PostID
    }
    
}


