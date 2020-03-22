//
//  LectureView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct LectureView: View {
    private let lecture: Lecture
    
    init(lecture: Lecture) {
        self.lecture = lecture
    }
    
    var body: some View {
        Text("Lecture \(self.lecture.number ?? -1)")
            .navigationBarTitle("Lecture", displayMode: .inline)
    }
}
