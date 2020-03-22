//
//  Lecture.swift
//  CoVoD
//
//  Created by Fredrik on 3/21/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import Foundation

public struct Lecture: Codable, Identifiable {
    public enum CodingKeys: String, CodingKey {
        case id
        case number
        case createdAt = "created_at"
        case commentCount = "comment_count"
        case media
        case description
    }
    
    public let id: Int
    public let number: Int?
    public let createdAt: String?
    public let commentCount: Int?
    public let media: Media?
    public let description: String?
    
    public struct Media: Codable {
        public let length: Int?
        public let thumbnail: String?
    }
}
