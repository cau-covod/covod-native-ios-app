//
//  OAuth2Token.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

public struct OAuth2Token: Codable {
    public enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case tokenType = "token_type"
        case scope
    }
    
    public let accessToken: String
    public let expiresIn: Int
    public let tokenType: String
    public let scope: String?
}
