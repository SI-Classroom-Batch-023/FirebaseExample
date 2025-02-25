//
//  LoginView.swift
//  FirebaseExample
//
//  Created by Felix B on 25.02.25.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack(spacing: 15) {
            TextField("Email", text: $viewModel.email)
                .appTextFieldStyle()
            SecureField("Password", text: $viewModel.password)
                .appTextFieldStyle()
            
            Button {
                viewModel.logInWithEmail()
            } label: {
                Text("Login Email")
                    .maxWidth()
            }
            .appButtonStyle()
            .padding(.top, 20)
            
            Button("Login Anon") {
                viewModel.logInAnon()
            }
            .appButtonStyle()
            
            Button("Noch keinen account?") {
                viewModel.showRegister.toggle()
            }
            .tint(.siYellow)
        }
        .padding(.horizontal)
        .maximize()
        .background(.siDeepPurple)
    }
}

#Preview {
    LoginView(viewModel: AuthViewModel())
}
