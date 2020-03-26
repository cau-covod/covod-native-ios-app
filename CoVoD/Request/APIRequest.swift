//
//  APIRequest.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import Foundation

public struct APIRequest<T> where T: Decodable {
    private let authentication: ServerAuthentication
    private let endpoint: String
    private let method: String
    private let query: [String: String]
    
    public init(authentication: ServerAuthentication, endpoint: String, method: String = "GET", query: [String: String] = [:]) {
        self.authentication = authentication
        self.endpoint = endpoint
        self.method = method
        self.query = query
    }
    
    public func perform(then: @escaping (Result<T, Error>) -> Void) {
        do {
            let request = try HTTPRequest(scheme: "https", host: authentication.serverHost, port: authentication.serverPort, path: "/api/v1\(endpoint)", method: method, query: query, headers: ["Authorization": "\(authentication.tokenType) \(authentication.token)"])
            
            if T.self == Empty.self {
                request.runAsync { then($0.map({ (_: Data) in Empty() } as! (Data) -> T)) }
            } else if T.self == String.self {
                request.fetchUTF8Async { then($0.map({ (s: String) in s } as! (String) -> T)) }
            } else {
                request.fetchJSONAsync(as: T.self, then: then)
            }
        } catch {
            then(.failure(error))
        }
    }
}
