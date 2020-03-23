//
//  User.swift
//  CoVoD
//
//  Created by Fredrik on 3/23/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

public struct User: Codable, Identifiable {
    public enum CodingKeys: String, CodingKey {
        case id
        case username
        case fullName = "full_name"
    }
    
    public let id: Int
    public let username: String?
    public let fullName: String?
}
