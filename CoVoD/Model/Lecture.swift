//
//  Lecture.swift
//  CoVoD
//
//  Created by Fredrik on 3/21/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import Foundation

public struct Lecture: Codable {
    public enum CodingKeys: String, CodingKey {
        case id
        case number
        case pubTime = "pub_time"
        case description
    }
    
    public let id: Int
    public let number: Int?
    public let pubTime: String?
    public let description: String?
}
