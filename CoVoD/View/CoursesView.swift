//
//  CoursesView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct CoursesView: View {
    private let courses: [Course]
    
    init(courses: [Course]) {
        self.courses = courses
    }
    
    var body: some View {
        NavigationView {
            if !courses.isEmpty {
                List(courses) { course in
                    NavigationLink(destination: LecturesView(lectures: course.lectures ?? [])) {
                        ListCard(
                            label: course.name ?? "Unnamed course",
                            description: course.description
                        )
                    }
                }
                    .navigationBarTitle("Courses")
            } else {
                Text("Please log in to fetch your course feed!")
            }
        }
    }
}
