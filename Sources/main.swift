// Simple API for creating a "hello world" JSON response.

import Foundation
import Kitura

let router = Router()

router.get("/HelloWorld") {
	request, response, next in
	response.send("Hello Kitura World")
	next()
}

let port = Int(ProcessInfo.processInfo.environment["PORT"] ?? "8090") ?? 8090

Kitura.addHTTPServer(onPort: port, with: router)

Kitura.run()
