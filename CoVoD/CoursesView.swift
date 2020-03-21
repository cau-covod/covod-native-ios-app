//
//  CoursesView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct CoursesView: View {
    @Binding private var courses: [Course]
    
    init(courses: Binding<[Course]>) {
        self._courses = courses
    }
    
    var body: some View {
        NavigationView {
            List(courses) { course in
                NavigationLink(destination: Text("Lectures")) {
                    VStack {
                        (Text(course.name ?? "Unnamed course")
                            .bold() +
                            (course.description != nil
                                ? Text("\n\(course.description!))")
                                    .font(.body)
                                    .foregroundColor(.gray)
                                : Text("")))
                            .multilineTextAlignment(.leading)
                    }
                }
            }
                .navigationBarTitle("Courses")
        }
    }
}
