//
//  AuthenticationRequest.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import Foundation

public struct OAuth2TokenRequest {
    private let clientId: String
    private let clientName: String
    private let clientSecret: String
    private let scope: String
    private let login: Login
    
    public init(
        clientId: String = "PPDPDvXf7bkd5bDLVhttUIxn",
        clientName: String = "app",
        clientSecret: String = "qvU7ckxCxYZBNfIItVRtPp5mML9UxnTu4M31migU9FYXTj13",
        scope: String = "view",
        login: Login
    ) {
        self.clientId = clientId
        self.clientName = clientName
        self.clientSecret = clientSecret
        self.scope = scope
        self.login = login
    }
    
    public func perform(then: @escaping (Result<OAuth2Token, Error>) -> Void) {
        do {
            let request = try HTTPRequest(scheme: "http", host: "git.bre4k3r.de", port: 22022, path: "/oauth2/token", method: "POST", query: [
                "grant_type": "password",
                "client_id": clientId,
                "client_name": clientName,
                "client_secret": clientSecret,
                "scope": scope,
                "username": login.username,
                "password": login.password
            ])
            request.fetchJSONAsync(as: OAuth2Token.self, then: then)
        } catch {
            then(.failure(error))
        }
    }
}
