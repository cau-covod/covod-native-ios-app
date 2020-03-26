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
    @ObservedObject private var viewModel = ContentViewModel()
    
    @State private var login: ServerLogin? = nil
    @State private var showLoginModal: Bool = true
 
    var body: some View {
        TabView(selection: $selection) {
            CoursesView(courses: viewModel.courses, authentication: viewModel.authentication)
                .alert(isPresented: $viewModel.showCoursesErrorAlert) {
                    Alert(title: Text("Something went wrong while fetching the courses."))
                }
                .tabItem {
                    VStack {
                        Image(systemName: "tv.fill")
                        Text("Courses")
                    }
                }
                .tag(0)
            SettingsView(login: $login, authentication: $viewModel.authentication, showLoginModal: $showLoginModal)
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .tag(1)
        }
            .sheet(isPresented: $showLoginModal) {
                OAuth2LoginView(login: self.$login, authentication: self.$viewModel.authentication, shown: self.$showLoginModal)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
