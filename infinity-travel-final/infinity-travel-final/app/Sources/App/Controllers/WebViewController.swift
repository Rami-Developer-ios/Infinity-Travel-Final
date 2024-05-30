//
//  WebViewController.swift
//
//
//  Created by Developer IOS on 29/05/2024.
//

import Vapor

struct WebViewController:RouteCollection {
    
    
    func boot(routes: any Vapor.RoutesBuilder) throws {
        
        routes.get { req async throws in
            try await req.view.render("index")
        }
        routes.get("index") { req async throws in
            try await req.view.render("index")
        }
        routes.get("services") { req async throws in
            try await req.view.render("services.leaf")
        }
        routes.get("about") { req async throws in
            try await req.view.render("about.leaf")
        }
        routes.get("single") { req async throws in
            try await req.view.render("single.leaf")
        }
        routes.get("contact") { req async throws in
            try await req.view.render("contact.leaf")
        }
        routes.get("blog") { req async throws in
            try await req.view.render("blog.leaf")
        }
       
        
        // Logistic
        routes.get("logistic") { req async throws in
            try await req.view.render("logistic/logistic.leaf")
        }
        routes.get("services-logistic") { req async throws in
            try await req.view.render("logistic/service.leaf")
        }
        routes.get("price") { req async throws in
            try await req.view.render("logistic/price.leaf")
        }
        routes.get("contact-logistic") { req async throws in
            
            try await req.view.render("logistic/contact.leaf")
        }
        routes.get("feature") { req async throws in
            try await req.view.render("logistic/feature.leaf")
        }
        routes.get("quote") { req async throws in
            try await req.view.render("logistic/quote.leaf")
        }
        
        // Travel
       
        routes.get("travel") { req async throws in
            try await req.view.render("travel/travel.leaf")
        }
        
        routes.get("packages") { req async throws in
            try await req.view.render("travel/packages.leaf")
        }
        
        // Booking
       
        routes.get("booking") { req async throws in
            try await req.view.render("Booking/book-index.leaf")
        }
        
        routes.get("blog-home") { req async throws in
            try await req.view.render("booking/blog-home.leaf")
        }
        routes.get("blog-single") { req async throws in
            try await req.view.render("booking/blog-single.leaf")
        }
      
        routes.get("contact-booking") { req async throws in
            try await req.view.render("booking/contact.leaf")
        }
        routes.get("hotels") { req async throws in
            try await req.view.render("booking/hotels.leaf")
        }
        routes.get("about-booking") { req async throws in
            try await req.view.render("booking/about.leaf")
        }
        routes.get("packages-booking") { req async throws in
            try await req.view.render("booking/packages.leaf")
        }
        routes.get("insurance") { req async throws in
            try await req.view.render("booking/insurance.leaf")
        }
        
    }
    
}
