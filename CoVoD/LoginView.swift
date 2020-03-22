//
//  LoginView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    private let handler: (Login, @escaping (Result<Void, Error>) -> Void) -> Void
    
    @Binding private var shown: Bool
    @State private var rawUsername: String = ""
    @State private var rawPassword: String = ""
    @State private var showingUsernameAlert: Bool = false
    @State private var showingPasswordAlert: Bool = false
    @State private var showingLoginErrorAlert: Bool = false
    @State private var loginErrorMessage: String? = nil
    
    init(shown: Binding<Bool>, handler: @escaping (Login, @escaping (Result<Void, Error>) -> Void) -> Void) {
        self.handler = handler
        self._shown = shown
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $rawUsername)
                    .alert(isPresented: $showingUsernameAlert) {
                        Alert(title: Text("Please enter a username!"))
                    }
                SecureField("Password", text: $rawPassword)
                    .alert(isPresented: $showingPasswordAlert) {
                        Alert(title: Text("Please enter a password!"))
                    }
                Button(action: {
                    guard !self.rawUsername.isEmpty else {
                        self.showingUsernameAlert = true
                        return
                    }
                    guard !self.rawPassword.isEmpty else {
                        self.showingPasswordAlert = true
                        return
                    }
                    self.handler(Login(username: self.rawUsername, password: self.rawPassword)) {
                        if case let .failure(error) = $0 {
                            print("\(error)")
                            if let e = error as? LoginError {
                                self.loginErrorMessage = e.message
                                self.showingLoginErrorAlert = true
                            } else {
                                self.loginErrorMessage = nil
                                self.showingLoginErrorAlert = true
                            }
                        } else {
                           self.shown = false
                       }
                    }
                }) {
                    Text("Login")
                }
                .alert(isPresented: $showingLoginErrorAlert) {
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
    @State private static var login: Login? = nil
    @State private static var shown: Bool = true
    
    static var previews: some View {
        LoginView(shown: $shown) { _, then in then(.success(())) }
    }
}
