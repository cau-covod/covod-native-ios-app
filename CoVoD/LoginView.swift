//
//  LoginView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @Binding private var model: Login?
    @Binding private var shown: Bool
    
    @State private var rawUsername: String = ""
    @State private var rawPassword: String = ""
    
    @State private var showingUsernameAlert: Bool = false
    @State private var showingPasswordAlert: Bool = false
    
    init(model: Binding<Login?>, shown: Binding<Bool>) {
        self._model = model
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
                    self.model = Login(username: self.rawUsername, password: self.rawPassword)
                    self.shown = false
                }) {
                    Text("Login")
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
        LoginView(model: $login, shown: $shown)
    }
}
