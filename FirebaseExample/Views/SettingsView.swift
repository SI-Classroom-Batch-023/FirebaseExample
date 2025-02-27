//
//  SettingsView.swift
//  FirebaseExample
//
//  Created by Felix B on 27.02.25.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var settingsViewmodel = SettingsViewModel()
    
    var body: some View {
        VStack {
            if let user = settingsViewmodel.appUser, let userID = user.id {
                Text(userID)
                Text(user.email)
                Text(user.username)
            }
            
            Button("Logout") {
                settingsViewmodel.logout()
            }
        }
    }
}

#Preview {
    SettingsView()
}
