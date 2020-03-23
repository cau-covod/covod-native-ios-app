//
//  Comment.swift
//  CoVoD
//
//  Created by Fredrik on 3/23/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

public struct Comment: Codable, Identifiable {
    public enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
        case timestamp
        case text
        case path
        case user
        case replies
    }
    
    public let id: Int
    public let createdAt: String?
    public let modifiedAt: String?
    public let timestamp: Int?
    public let text: String?
    public let path: String?
    public let user: User?
    public let replies: [Comment]?
    
    public var flatReplies: [Comment] {
        (replies ?? []).flatMap { [$0] + $0.flatReplies }
    }
}
