//
//  ListCard.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct ListCard: View {
    private let label: String
    private let description: String?
    
    init(label: String, description: String? = nil) {
        self.label = label
        self.description = description
    }
    
    var body: some View {
        (Text(label)
            .bold() +
        (description != nil
            ? Text("\n\(description!)")
                .font(.body)
                .foregroundColor(.gray)
            : Text("")))
            .multilineTextAlignment(.leading)
    }
}
