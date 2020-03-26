//
//  Regex.swift
//  CoVoD
//
//  Created by Fredrik on 3/26/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import Foundation

public struct Regex {
    private let regex: NSRegularExpression
    
    public init(from pattern: String) throws {
        regex = try NSRegularExpression(pattern: pattern)
    }
    
    public func firstGroups(in str: String) -> [String]? {
        regex.firstMatch(in: str, range: NSRange(str.startIndex..., in: str))
            .map { match in (0..<match.numberOfRanges).map { Range(match.range(at: $0), in: str).map { String(str[$0]) } ?? "" } }
    }
}
