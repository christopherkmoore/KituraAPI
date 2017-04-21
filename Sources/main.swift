// Simple API for creating a "hello world" JSON response.

import Kitura

let router = Router()

router.post("/") {
	request, response, next in
	response.send("Hello World")
	next()
}

Kitura.addHTTPServer(onPort: 8090, with: router)

Kitura.run()
