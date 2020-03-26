//
//  LoginView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

fileprivate let hostPortPattern = try! Regex(from: "([^:\\a]+):(\\d+)")

struct LoginView: View {
    private let handler: (ServerLogin, @escaping (Result<Void, Error>) -> Void) -> Void
    
    @Binding private var shown: Bool
    @State private var rawServerHostPort: String = "covod.bre4k3r.de:443"
    @State private var rawUsername: String = ""
    @State private var rawPassword: String = ""
    @State private var showServerAlert: Bool = false
    @State private var showUsernameAlert: Bool = false
    @State private var showPasswordAlert: Bool = false
    @State private var showLoginErrorAlert: Bool = false
    @State private var loginErrorMessage: String? = nil
    
    init(shown: Binding<Bool>, handler: @escaping (ServerLogin, @escaping (Result<Void, Error>) -> Void) -> Void) {
        self.handler = handler
        self._shown = shown
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Server", text: $rawServerHostPort)
                    .alert(isPresented: $showServerAlert) {
                        Alert(title: Text("Please enter a valid server host/port!"))
                    }
                TextField("Username", text: $rawUsername)
                    .alert(isPresented: $showUsernameAlert) {
                        Alert(title: Text("Please enter a username!"))
                    }
                SecureField("Password", text: $rawPassword)
                    .alert(isPresented: $showPasswordAlert) {
                        Alert(title: Text("Please enter a password!"))
                    }
                Button(action: {
                    guard let parsedHostPort = hostPortPattern.firstGroups(in: self.rawServerHostPort) else {
                        self.showServerAlert = true
                        return
                    }
                    guard !self.rawUsername.isEmpty else {
                        self.showUsernameAlert = true
                        return
                    }
                    guard !self.rawPassword.isEmpty else {
                        self.showPasswordAlert = true
                        return
                    }
                    self.handler(ServerLogin(
                        serverHost: parsedHostPort[1],
                        serverPort: Int(parsedHostPort[2]) ?? 443,
                        username: self.rawUsername,
                        password: self.rawPassword
                    )) {
                        if case let .failure(error) = $0 {
                            print("\(error)")
                            if let e = error as? LoginError {
                                self.loginErrorMessage = e.message
                                self.showLoginErrorAlert = true
                            } else {
                                self.loginErrorMessage = nil
                                self.showLoginErrorAlert = true
                            }
                        } else {
                           self.shown = false
                       }
                    }
                }) {
                    Text("Login")
                }
                .alert(isPresented: $showLoginErrorAlert) {
                    Alert(title: Text(loginErrorMessage ?? "Something went wrong"))
                }
            }
                .padding(25.0)
                .navigationBarTitle("Login", displayMode: .inline)
                .navigationBarItems(leading: Button(action: { self.shown = false }) {
                    Text("Dismiss")
                })
                
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @State private static var login: ServerLogin? = nil
    @State private static var shown: Bool = true
    
    static var previews: some View {
        LoginView(shown: $shown) { _, then in then(.success(())) }
    }
}
