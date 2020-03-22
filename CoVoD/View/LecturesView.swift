//
//  LecturesView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct LecturesView: View {
    private let lectures: [Lecture]
    
    init(lectures: [Lecture]) {
        self.lectures = lectures
    }
    
    var body: some View {
        List(lectures) { lecture in
            ListCard(label: "Lecture \(lecture.number ?? -1)", description: lecture.pubTime)
        }
            .navigationBarTitle("Lectures")
    }
}
