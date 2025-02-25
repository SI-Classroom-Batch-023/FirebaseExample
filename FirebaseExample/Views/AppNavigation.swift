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
            if let userID = authViewModel.user?.uid {
                Text(userID)
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
