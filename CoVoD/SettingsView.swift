//
//  SettingsView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State var login: Login? = nil
    
    @State var showLoginModal: Bool = false
    
    var body: some View {
        VStack(spacing: 10.0) {
            Button(action: { self.showLoginModal.toggle() }) {
                Text("Login")
            }
            Text(login.map { "logged in as \($0.username)" } ?? "not logged in")
                .font(.caption)
                .italic()
        }
            .sheet(isPresented: $showLoginModal) {
                LoginView(shown: self.$showLoginModal) {
                    self.login = $0
                }
            }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
