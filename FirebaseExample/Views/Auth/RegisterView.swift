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
        
        TextField("Email", text: $viewModel.email)
            .appTextFieldStyle()
        SecureField("Password", text: $viewModel.password)
            .appTextFieldStyle()
        
        Button("Register Email") {
            viewModel.registerWithEmail()
        }
        
        Button("Doch schon einen account?") {
            viewModel.showRegister.toggle()
        }
    }
}

#Preview {
    RegisterView(viewModel: AuthViewModel())
}
