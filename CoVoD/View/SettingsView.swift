//
//  SettingsView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Binding var authentication: Authentication?
    @State var login: Login? = nil
    
    @State var showLoginModal: Bool = false
    
    init(authentication: Binding<Authentication?>) {
        self._authentication = authentication
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
            .sheet(isPresented: $showLoginModal) {
                LoginView(shown: self.$showLoginModal) { login, then in
                    OAuth2TokenRequest(login: login).perform {
                        switch $0 {
                        case .success(let token):
                            self.login = login
                            DispatchQueue.main.async {
                                self.authentication = Authentication(token: token.accessToken, tokenType: token.tokenType)
                            }
                            then(.success(()))
                        case .failure(let error):
                            then(.failure(error))
                        }
                    }
                }
            }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State private static var authentication: Authentication? = nil
    
    static var previews: some View {
        SettingsView(authentication: $authentication)
    }
}
