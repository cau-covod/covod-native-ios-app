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
    
    private var authentication: ServerAuthentication
    
    init(lecture: Lecture, authentication: ServerAuthentication) {
        self.lecture = lecture
        self.authentication = authentication
    }
    
    var body: some View {
        VStack {
            PlayerView(url: URL(string: "https://covod.bre4k3r.de/api/v1/lecture/\(lecture.id)/media")!, headers: ["Authorization": "\(authentication.tokenType) \(authentication.token)"])
            CommentsView(lecture: lecture, authentication: authentication)
        }
            .navigationBarTitle("Lecture", displayMode: .inline)
    }
}
