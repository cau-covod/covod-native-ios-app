//
//  ContentView.swift
//  CoVoD
//
//  Created by Fredrik on 3/21/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var courses: [Course] = []
    
    init(courses: [Course]) {
        self.courses = courses
    }
 
    var body: some View {
        TabView(selection: $selection) {
            CoursesView(courses: $courses)
                .tabItem {
                    VStack {
                        Image(systemName: "tv.fill")
                        Text("Courses")
                    }
                }
                .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(courses: [
            Course(id: 0, name: "Algorithms and Data Structures", description: "Algorithmic algorithms and structural structres", lectures: [
                Lecture(id: 0, number: 0, pubTime: "now", description: "Blub blub"),
                Lecture(id: 1, number: 0, pubTime: "now", description: "Blub blub"),
                Lecture(id: 2, number: 0, pubTime: "now", description: "Blub blub")
            ])
        ])
    }
}
