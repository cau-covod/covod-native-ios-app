//
//  APIRequest.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

public struct APIRequest<T> where T: Decodable {
    private let authentication: Authentication
    private let endpoint: String
    
    public init(authentication: Authentication, endpoint: String) {
        self.authentication = authentication
        self.endpoint = endpoint
    }
    
    public func perform(then: @escaping (Result<T, Error>) -> Void) {
        do {
            let request = try HTTPRequest(scheme: "http", host: "git.bre4k3r.de", port: 22022, path: "/api/v1\(endpoint)", headers: ["Authorization": "\(authentication.tokenType) \(authentication.token)"])
            request.fetchJSONAsync(as: T.self, then: then)
        } catch {
            then(.failure(error))
        }
    }
}
