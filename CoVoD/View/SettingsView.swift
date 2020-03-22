//
//  SettingsView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Binding var login: Login?
    @Binding var authentication: Authentication?
    
    @Binding var showLoginModal: Bool
    
    init(login: Binding<Login?>, authentication: Binding<Authentication?>, showLoginModal: Binding<Bool>) {
        self._login = login
        self._authentication = authentication
        self._showLoginModal = showLoginModal
    }
    
    var body: some View {
        VStack(spacing: 10.0) {
            Button(action: { self.showLoginModal.toggle() }) {
                Text("Login")
            }
            Text(authentication.map { "logged in as \(login!.username)\ntoken: \($0.token)" } ?? "not logged in")
                .font(.caption)
                .italic()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State private static var login: Login? = nil
    @State private static var authentication: Authentication? = nil
    @State private static var showLoginModal: Bool = false
    
    static var previews: some View {
        SettingsView(login: $login, authentication: $authentication, showLoginModal: $showLoginModal)
    }
}
