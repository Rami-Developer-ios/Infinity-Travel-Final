import Fluent
import Vapor

func routes(_ app: Application) throws {
 

    
    try app.register(collection: TodoController())
    
    try app.register(collection: ServiceController())
    
    try app.register(collection:TravelDestinationController())
    
    try app.register(collection: PostController())
    
    let webController = WebViewController()
    try app.register(collection: webController)
}
