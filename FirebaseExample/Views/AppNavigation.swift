//
//  AppNavigation.swift
//  FirebaseExample
//
//  Created by Felix B on 25.02.25.
//

import SwiftUI

struct AppNavigation: View {
    
    var body: some View {
        TabView {
            Tab("Chats", systemImage: "bubble") {
                ChatListView()
            }
            
            Tab("Einstellungen", systemImage: "wrench") {
                SettingsView()
            }
        }
    }
}

#Preview {
    AppNavigation()
}
