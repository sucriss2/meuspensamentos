//
//  Request.swift
//  meuspensamentos
//
//  Created by Suh on 06/06/23.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case delete = "DELETE"
    case post = "POST"
}

struct Request {
    var baseURL: String
    var method: RequestMethod
    var body: Data?
}
