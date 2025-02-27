//
//  AuthView.swift
//  FirebaseExample
//
//  Created by Felix B on 25.02.25.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject private var viewModel = AuthViewModel()
    
    var body: some View {
        if viewModel.isUserLoggedIn {
            AppNavigation()
        } else {
            if viewModel.showRegister {
                RegisterView(viewModel: viewModel)
            } else {
                LoginView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    AuthView()
}
