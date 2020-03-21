//
//  Course.swift
//  CoVoD
//
//  Created by Fredrik on 3/21/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import Foundation

public struct Course: Codable, Identifiable {
    public let id: Int
    public let name: String?
    public let description: String?
    public let lectures: [Lecture]?
}
