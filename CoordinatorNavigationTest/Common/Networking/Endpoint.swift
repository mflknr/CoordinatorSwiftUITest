//
//
// Created by __FULLUSERNAME__ on __DATE__.
// 
//

import Foundation

typealias HTTPHeaders = [String: String]

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

struct Endpoint {
    var path: String
    var method: RequestMethod
    var headers: HTTPHeaders?
}

extension Endpoint {
    static let book: Endpoint = Endpoint(path: "/book", method: .get)
    static func book(by id: String) -> Endpoint { Endpoint(path: "/book/\(id)", method: .get) }
    static func chapter(by id: String) -> Endpoint { Endpoint(path: "/book/\(id)/chapter", method: .get) }
}
