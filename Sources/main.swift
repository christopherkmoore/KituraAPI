// Simple API for creating a "hello world" JSON response.

import Foundation
import Kitura

let router = Router()

struct Todo: Codable {
    var title: String
    var id: Int?
    var userId: Int
    var completed: Int
}

var todos = [Todo]()
todos.append(Todo(title: "Hello World", id: 8, userId: 420, completed: 1))

func encodeJSON(completion: @escaping (Data?, String?) -> Void) {
    
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(todos)
        completion(data, nil)
    } catch {
        print("we fucked up over here.") ; return
    }
}

router.get("/HelloWorld") {
	request, response, next in
    encodeJSON() { (data, error) in
        if let data = data {
            response.send(data: data)
        } else {
            response.send("error")
        }
    }
	next()
}

let port = Int(ProcessInfo.processInfo.environment["PORT"] ?? "8090") ?? 8090

Kitura.addHTTPServer(onPort: port, with: router)

Kitura.run()
