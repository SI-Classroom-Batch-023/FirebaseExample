//
//  RegisterView.swift
//  FirebaseExample
//
//  Created by Felix B on 25.02.25.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack {
            TextField("Email", text: $viewModel.email)
                .appTextFieldStyle()
            
            SecureField("Password", text: $viewModel.password)
                .appTextFieldStyle()
            
            TextField("Username", text: $viewModel.username)
                .appTextFieldStyle()
            
            Button("Register Email") {
                viewModel.registerWithEmail()
            }
            .appButtonStyle()
            .padding(.top, 20)
            
            Button("Doch schon einen account?") {
                viewModel.showRegister.toggle()
            }
            .tint(.siYellow)
            
            Text(viewModel.errorText)
                .foregroundStyle(.red)
        }
        .padding(.horizontal)
        .maximize()
        .background(.siDeepPurple)
    }
}

#Preview {
    RegisterView(viewModel: AuthViewModel())
}
