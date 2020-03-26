//
//  OAuth2LoginView.swift
//  CoVoD
//
//  Created by Fredrik on 3/22/20.
//  Copyright © 2020 Fredrik. All rights reserved.
//

import SwiftUI

struct OAuth2LoginView: View {
    @Binding var login: ServerLogin?
    @Binding var authentication: ServerAuthentication?
    @Binding var shown: Bool
    
    init(login: Binding<ServerLogin?>, authentication: Binding<ServerAuthentication?>, shown: Binding<Bool>) {
        self._login = login
        self._authentication = authentication
        self._shown = shown
    }
    
    var body: some View {
        LoginView(shown: $shown) { login, then in
            OAuth2TokenRequest(login: login).perform {
                switch $0 {
                case .success(let token):
                    self.login = login
                    DispatchQueue.main.async {
                        self.authentication = ServerAuthentication(serverScheme: login.serverScheme, serverHost: login.serverHost, serverPort: login.serverPort, token: token.accessToken, tokenType: token.tokenType)
                    }
                    then(.success(()))
                case .failure(let error):
                    then(.failure(error))
                }
            }
        }
    }
}
