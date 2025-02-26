//
//  AppNavigation.swift
//  FirebaseExample
//
//  Created by Felix B on 25.02.25.
//

import SwiftUI

struct AppNavigation: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            if let user = authViewModel.appUser, let userID = user.id {
                Text(userID)
                Text(user.email)
                Text(user.username)
            }
            
            Button("Logout") {
                authViewModel.logout()
            }
        }
    }
}

#Preview {
    AppNavigation()
        .environmentObject(AuthViewModel())
}
