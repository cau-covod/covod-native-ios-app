//
//  CommentsView.swift
//  CoVoD
//
//  Created by Fredrik on 3/23/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct CommentsView: View {
    private var lecture: Lecture
    
    init(lecture: Lecture) {
        self.lecture = lecture
    }
    
    var body: some View {
        Text("\(lecture.commentCount ?? 0) \("comment".pluralize(with: lecture.commentCount ?? 0))")
    }
}
