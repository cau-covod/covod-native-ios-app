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
    private let inputDateFormatter = DateFormatter()
    private let outputDateFormatter = DateFormatter()
    
    init(lectures: [Lecture]) {
        self.lectures = lectures
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        outputDateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
    }
    
    var body: some View {
        List(lectures) { lecture in
            NavigationLink(destination: LectureView(lecture: lecture)) {
                ListCard(label: "Lecture \(lecture.number ?? -1)", description: [
                    lecture.description,
                    lecture.createdAt.flatMap(self.inputDateFormatter.date(from:)).map(self.outputDateFormatter.string(from:)),
                    lecture.commentCount.map { "\($0) comments" }
                ].compactMap { $0 }.joined(separator: "\n"))
            }
        }
            .navigationBarTitle("Lectures")
    }
}
